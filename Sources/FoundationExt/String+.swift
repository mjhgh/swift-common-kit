extension String {
  public var asDataUTF8: Data {
    return data(using: .utf8)!
  }
  public var asURL: URL? {
    return URL(string: self)
  }
}
