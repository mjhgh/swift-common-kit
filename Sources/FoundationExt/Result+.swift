import Foundation

extension Result {  
  public init(execute: () async throws(Failure) -> Success) async {
    do {
      let value = try await execute()
      self = .success(value)
    } catch {
      self = .failure(error)
    }
  }

  public var asSuccess: Success? {
    if case .success(let value) = self {
      return value
    }
    return nil
  }

  public var asFailure: Failure? {
    if case .failure(let error) = self {
      return error
    }
    return nil
  }
}
