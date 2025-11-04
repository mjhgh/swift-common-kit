import Foundation

extension Array {
  public func prepending(_ element: Element) -> [Element] {
    return [element] + self
  }
}
