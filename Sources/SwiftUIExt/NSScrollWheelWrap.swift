import AppKit
import SwiftUI

public struct NSScrollWheelWrap<Content: View>: NSViewRepresentable {
  private class ScrollWheelHandlerView: NSHostingView<Content> {
    var onScrollWheel: ((NSEvent) -> Void)?

    override func scrollWheel(with event: NSEvent) {
      onScrollWheel?(event)
      super.scrollWheel(with: event)
    }
  }

  public var onScrollWheel: (NSEvent) -> Void
  public var content: () -> Content

  public init(
    onScrollWheel: @escaping (NSEvent) -> Void,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.onScrollWheel = onScrollWheel
    self.content = content
  }

  public func makeNSView(context: Context) -> NSHostingView<Content> {
    let hostingView = ScrollWheelHandlerView(rootView: content())
    hostingView.sizingOptions = .minSize
    return hostingView
  }

  public func updateNSView(_ nsView: NSHostingView<Content>, context: Context) {
    nsView.rootView = content()
  }
}

extension View {
  public func onScrollWheel(perform action: @escaping (NSEvent) -> Void) -> some View {
    NSScrollWheelWrap(onScrollWheel: action) { self }
  }
}
