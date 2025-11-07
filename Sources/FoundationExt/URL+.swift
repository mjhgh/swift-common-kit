import Foundation

extension URL {
  @MainActor
  public static var namedExecutableURLCache: [String: URL] = [:]

  /// Finds the URL of a named binary in the system's PATH.
  @MainActor
  public static func forExecutable(name: String) -> URL? {
    if let cached = namedExecutableURLCache[name] {
      return cached
    }

    // Get PATH environment variable
    guard let pathString = ProcessInfo.processInfo.environment["PATH"] else {
      return nil
    }

    // Split PATH into individual directories
    let pathDirectories = pathString.components(separatedBy: ":")

    // Search for the binary in each PATH directory
    for directory in pathDirectories {
      let binaryURL = URL(fileURLWithPath: directory).appendingPathComponent(name)

      // Check if the binary exists and is accessible
      if FileManager.default.fileExists(atPath: binaryURL.path) {
        // Cache the result
        namedExecutableURLCache[name] = binaryURL
        return binaryURL
      }
    }

    return nil
  }

  public func asURLComponents() -> URLComponents? {
    return URLComponents(url: self, resolvingAgainstBaseURL: false)
  }
  public func asURLComponents(resolvingAgainstBaseURL: Bool) -> URLComponents? {
    return URLComponents(url: self, resolvingAgainstBaseURL: resolvingAgainstBaseURL)
  }
  public func asURLRequest() -> URLRequest {
    return URLRequest(url: self)
  }
  public func asURLRequest(cachePolicy: URLRequest.CachePolicy, timeoutInterval: TimeInterval)
    -> URLRequest
  {
    return URLRequest(url: self, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
  }
}
