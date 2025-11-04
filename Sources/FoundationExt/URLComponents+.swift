import Foundation

extension URLComponents {
  public func edit(by: (inout URLComponents) -> Void) -> URLComponents {
    var copy = self
    by(&copy)
    return copy
  }
}
