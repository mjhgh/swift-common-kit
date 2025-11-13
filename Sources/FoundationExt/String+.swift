#if canImport(AppKit)
  import AppKit
#endif
extension String {
  public var asDataUTF8: Data? {
    return data(using: .utf8)
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
  #if canImport(AppKit)
    public func decodingHTMLEntities() -> String {
      guard let data = self.data(using: .utf8) else {
        return self
      }
      let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
        .documentType: NSAttributedString.DocumentType.html,
        .characterEncoding: String.Encoding.utf8.rawValue,
      ]
      if let attributedString = NSAttributedString(
        html: data, options: options, documentAttributes: nil)
      {
        return attributedString.string
      } else {
        return self
      }

    }
  #endif
}
