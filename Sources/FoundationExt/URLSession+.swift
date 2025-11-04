import Foundation

extension URLSession {
  public static let empheral: URLSession = {
    let configuration = URLSessionConfiguration.ephemeral
    return URLSession(configuration: configuration)
  }()
}
