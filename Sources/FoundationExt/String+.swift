extension String {
  public var asDataUTF8: Data {
    return data(using: .utf8)!
  }
}
