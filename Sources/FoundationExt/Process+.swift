import Foundation

extension Process {
  public func ignoreStdio() {
    standardError = nil
    standardInput = nil
    standardOutput = nil
  }
}
