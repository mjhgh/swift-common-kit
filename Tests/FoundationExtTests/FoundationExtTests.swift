import Testing

@testable import FoundationExt

@Test func testReadAllAsData() async throws {
  let p = Process()
  p.executableURL = await .forExecutable(name: "echo")!
  p.arguments = ["Hello, World!"]
  let stdout: Pipe = Pipe()
  p.standardOutput = stdout
  try p.run()
  #expect(
    try await stdout.fileHandleForReading.readAllAsData().asStringUTF8?.removingTrailingLinebreak()
      == "Hello, World!"
  )
}
