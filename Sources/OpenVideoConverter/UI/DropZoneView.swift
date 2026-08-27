import AppKit

final class DropZoneView: NSView {
    var onFileURLsDropped: (([URL]) -> Void)?
    var onChooseFiles: (() -> Void)?

    private let iconView = NSImageView()
    private let prefixLabel = NSTextField(labelWithString: "Drop videos here or")
    private let chooseButton = NSButton(title: "Choose Files…", target: nil, action: nil)

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
        layer?.backgroundColor = NSColor(hex: 0x292B2E).cgColor
        registerForDraggedTypes([.fileURL])

        iconView.image = NSImage(systemSymbolName: "tray.and.arrow.down", accessibilityDescription: "Add videos")
        iconView.symbolConfiguration = NSImage.SymbolConfiguration(pointSize: 82, weight: .light)
        iconView.contentTintColor = NSColor.black.withAlphaComponent(0.42)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconView)

        prefixLabel.font = .systemFont(ofSize: 22, weight: .regular)
        prefixLabel.textColor = .white

        chooseButton.isBordered = false
        chooseButton.attributedTitle = NSAttributedString(
            string: "Choose Files…",
            attributes: [
                .foregroundColor: NSColor.white,
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .font: NSFont.systemFont(ofSize: 22, weight: .regular)
            ]
        )
        chooseButton.target = self
        chooseButton.action = #selector(chooseFiles)

        let message = NSStackView(views: [prefixLabel, chooseButton])
        message.orientation = .horizontal
        message.spacing = 7
        message.alignment = .centerY
        message.translatesAutoresizingMaskIntoConstraints = false
        addSubview(message)
        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -56),
            message.centerXAnchor.constraint(equalTo: centerXAnchor),
            message.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 88)
        ])
    }

    required init?(coder: NSCoder) {
        nil
    }

    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        layer?.backgroundColor = NSColor(hex: 0x33373A).cgColor
        return .copy
    }

    override func draggingExited(_ sender: NSDraggingInfo?) {
        layer?.backgroundColor = NSColor(hex: 0x292B2E).cgColor
    }

    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        defer { layer?.backgroundColor = NSColor(hex: 0x292B2E).cgColor }
        let urls = sender.draggingPasteboard.readObjects(forClasses: [NSURL.self], options: nil) as? [URL] ?? []
        guard !urls.isEmpty else { return false }
        onFileURLsDropped?(urls)
        return true
    }

    @objc private func chooseFiles() {
        onChooseFiles?()
    }
}

extension NSColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1) {
        self.init(
            calibratedRed: CGFloat((hex >> 16) & 0xFF) / 255,
            green: CGFloat((hex >> 8) & 0xFF) / 255,
            blue: CGFloat(hex & 0xFF) / 255,
            alpha: alpha
        )
    }
}
