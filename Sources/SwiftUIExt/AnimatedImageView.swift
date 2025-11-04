import SwiftUI
import AppKit

public struct AnimatedImageView: NSViewRepresentable {
	public let nsImage: NSImage

	public init(nsImage: NSImage) {
		self.nsImage = nsImage
	}

	public func makeNSView(context: Context) -> NSImageView {
		let imageView = NSImageView()
		imageView.image = nsImage
		imageView.canDrawSubviewsIntoLayer = true
		imageView.animates = isAnimatedImage(nsImage)
		return imageView
	}

	public func updateNSView(_ nsView: NSImageView, context: Context) {
		nsView.image = nsImage
		nsView.animates = isAnimatedImage(nsImage)
	}

	// Checks if the NSImage is animated (GIF). WebP is not natively supported by AppKit.
	private func isAnimatedImage(_ image: NSImage) -> Bool {
		for rep in image.representations {
			if let bitmapRep = rep as? NSBitmapImageRep {
				if let frameCount = bitmapRep.value(forProperty: .frameCount) as? Int, frameCount > 1 {
					return true
				}
			}
		}
		return false
	}
}
