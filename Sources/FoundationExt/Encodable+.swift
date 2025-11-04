import Foundation

extension Encodable {
  public func toJSONData(encoder: JSONEncoder = JSONEncoder()) throws -> Data {
    return try encoder.encode(self)
  }
}
