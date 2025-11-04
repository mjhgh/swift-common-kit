import Foundation

extension URL {
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
