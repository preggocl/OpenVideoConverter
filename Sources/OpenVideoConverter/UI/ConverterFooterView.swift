import AppKit

final class ConverterFooterView: NSView {
    override func draw(_ dirtyRect: NSRect) {
        NSGradient(colors: [NSColor(hex: 0x687074), NSColor(hex: 0x4A5053)])?.draw(in: bounds, angle: -90)
    }
}
