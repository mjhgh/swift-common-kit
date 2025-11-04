import Foundation

extension Decodable {
  public static func fromJSON(data: Data, decoder: JSONDecoder = JSONDecoder()) throws -> Self {
    return try decoder.decode(Self.self, from: data)
  }

  public static func fromJSON(url: URL, decoder: JSONDecoder = JSONDecoder()) async throws -> Self {
    let (data, _) = try await URLSession.shared.data(from: url)
    return try decoder.decode(Self.self, from: data)
  }

  public static func fromJSON(urlRequest: URLRequest, decoder: JSONDecoder = JSONDecoder())
    async throws -> Self
  {
    let (data, _) = try await URLSession.shared.data(for: urlRequest)
    return try decoder.decode(Self.self, from: data)
  }

}
