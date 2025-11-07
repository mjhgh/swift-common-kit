extension Dictionary {
  public mutating func getOrSet(key: Key, orSet: @autoclosure () -> Value) -> Value {
    if let value = self[key] {
      return value
    } else {
      let newValue = orSet()
      self[key] = newValue
      return newValue
    }

  }
}
