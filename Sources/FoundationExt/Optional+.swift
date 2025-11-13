public struct OptionalUnwrapError: Error, Sendable {
  public let reason: String
}

extension Optional {
  public func unwrap(reason: String = "") throws -> Wrapped {
    if let value = self {
      return value
    } else {
      throw OptionalUnwrapError(reason: reason)
    }
  }

}
