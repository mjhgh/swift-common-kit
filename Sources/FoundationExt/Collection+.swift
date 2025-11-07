import Foundation

extension Collection {
  public func mapFirstNonNil<T>(_ transform: (Element) -> T?) -> T? {
    for element in self {
      if let result = transform(element) {
        return result
      }
    }
    return nil
  }

  public func sortBy<Key: Hashable>(key: (Element) -> Key) -> [Element] {
    var dict: [Key: Element] = [:]
    for element in self {
      dict[key(element)] = element
    }
    let sortedKeys = dict.keys.sorted { "\($0)" < "\($1)" }
    return sortedKeys.compactMap { dict[$0] }

  }

  public var asArray: [Element] {
    return Array(self)
  }

}

extension Collection {
  public subscript(safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
