import Foundation

public enum JSONValue {
  case string(String)
  case number(Double)
  case object([String: JSONValue])
  case array([JSONValue])
  case bool(Bool)
  case null
}
extension JSONValue {
  public var asString: String? {
    if case .string(let value) = self {
      return value
    }
    return nil
  }
  public var asNumber: Double? {
    if case .number(let value) = self {
      return value
    }
    return nil
  }
  public var asObject: [String: JSONValue]? {
    if case .object(let value) = self {
      return value
    }
    return nil
  }
  public var asArray: [JSONValue]? {
    if case .array(let value) = self {
      return value
    }
    return nil
  }
  public var asBool: Bool? {
    if case .bool(let value) = self {
      return value
    }
    return nil
  }
  public var isNull: Bool {
    if case .null = self {
      return true
    }
    return false
  }

  public func decode<T: Decodable>(as: T.Type, decoder: JSONDecoder = JSONDecoder()) throws -> T {
    let data = try JSONEncoder().encode(self)
    return try decoder.decode(T.self, from: data)
  }
}

extension JSONValue: Decodable {
  public init(from decoder: any Decoder) throws {
    let container = try decoder.singleValueContainer()

    if container.decodeNil() {
      self = .null
    } else if let bool = try? container.decode(Bool.self) {
      self = .bool(bool)
    } else if let number = try? container.decode(Double.self) {
      self = .number(number)
    } else if let string = try? container.decode(String.self) {
      self = .string(string)
    } else if let array = try? container.decode([JSONValue].self) {
      self = .array(array)
    } else if let object = try? container.decode([String: JSONValue].self) {
      self = .object(object)
    } else {
      throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid JSON value")
    }
  }
}
extension JSONValue: Encodable {
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .string(let value):
      try container.encode(value)
    case .number(let value):
      try container.encode(value)
    case .object(let value):
      try container.encode(value)
    case .array(let value):
      try container.encode(value)
    case .bool(let value):
      try container.encode(value)
    case .null:
      try container.encodeNil()
    }
  }
}
