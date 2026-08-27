import AppKit

final class ConverterControlButton: NSButton {
    enum Style { case menu, action }

    private let style: Style

    init(title: String, symbolName: String? = nil, style: Style = .menu) {
        self.style = style
        super.init(frame: .zero)
        self.title = style == .menu ? "\(title)  ▾" : title
        isBordered = false
        bezelStyle = .regularSquare
        font = .systemFont(ofSize: style == .menu ? 17 : 22, weight: .medium)
        contentTintColor = .white
        image = symbolName.flatMap { NSImage(systemSymbolName: $0, accessibilityDescription: nil) }
        imagePosition = symbolName == nil ? .noImage : .imageLeading
        wantsLayer = true
        layer?.cornerRadius = style == .menu ? 6 : 7
        updateAppearance()
    }

    required init?(coder: NSCoder) { nil }

    override var isEnabled: Bool { didSet { updateAppearance() } }

    override func updateLayer() {
        super.updateLayer()
        updateAppearance()
    }

    private func updateAppearance() {
        guard let layer else { return }
        switch style {
        case .menu:
            layer.backgroundColor = (isEnabled ? NSColor(hex: 0x4A5053) : NSColor(hex: 0x3B3F42)).cgColor
            layer.borderColor = NSColor.black.withAlphaComponent(0.55).cgColor
        case .action:
            layer.backgroundColor = (isEnabled ? NSColor(hex: 0x34393C) : NSColor(hex: 0x303437)).cgColor
            layer.borderColor = NSColor.black.withAlphaComponent(0.65).cgColor
        }
        layer.borderWidth = 1
        alphaValue = isEnabled ? 1 : 0.48
    }
}
