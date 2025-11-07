import Foundation

extension FileHandle {
  public func readAllAsData() async throws -> Data {
    var data = Data()
    for try await byte in self.bytes {
      data.append(byte)
    }
    return data
  }
}
