import SwiftUI

public struct NSViewRepresentableWrapper: NSViewRepresentable {
  public let nsView: NSView

  public func makeNSView(context: Context) -> NSView {
    nsView
  }

  public func updateNSView(_ nsView: NSView, context: Context) {
  }
}

extension NSView {
  public var asSwiftUIView: some View {
    NSViewRepresentableWrapper(nsView: self)
  }
}
