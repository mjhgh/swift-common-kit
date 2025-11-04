import Foundation

extension Data {
  public var asStringUTF8: String? {
    return String(data: self, encoding: .utf8)
  }

  public var asStringAutoDetect: String {
    String(data: self, encoding: self.stringEncoding)!
  }

  public var stringEncoding: String.Encoding {
    // var encoding: UInt = 0
    var convertedString: NSString?
    var usedLossyConversion: ObjCBool = false

    NSString.stringEncoding(
      for: self,
      encodingOptions: nil,
      convertedString: &convertedString,
      usedLossyConversion: &usedLossyConversion
    )

    if let result = convertedString?.fastestEncoding {
      return String.Encoding(rawValue: result)
    }

    return .utf8
  }
}
