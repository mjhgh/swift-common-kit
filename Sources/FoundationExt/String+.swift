extension String {
  public var asDataUTF8: Data {
    return data(using: .utf8)!
  }
  public var asURL: URL? {
    return URL(string: self)
  }
  public var asInt: Int? {
    return Int(self)
  }
  public var asDouble: Double? {
    return Double(self)
  }

  public func removingTrailingLinebreak() -> String {
    if self.hasSuffix("\n") {
      return String(self.dropLast())
    }
    return self
  }
}
