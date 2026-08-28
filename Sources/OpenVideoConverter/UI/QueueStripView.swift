import AppKit

final class QueueStripView: NSView {
    var onRemove: ((UUID) -> Void)?

    private let countLabel = NSTextField(labelWithString: "")
    private let fileIcon = NSImageView()
    private let fileNameLabel = NSTextField(labelWithString: "")
    private let statusLabel = NSTextField(labelWithString: "Ready to convert")
    private let moreLabel = NSTextField(labelWithString: "")
    private let removeButton = NSButton(title: "", target: nil, action: nil)
    private var displayedItemID: UUID?

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
        layer?.backgroundColor = NSColor(hex: 0x34373A).cgColor

        countLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        countLabel.textColor = NSColor.white.withAlphaComponent(0.72)
        countLabel.translatesAutoresizingMaskIntoConstraints = false

        fileIcon.image = NSImage(systemSymbolName: "film", accessibilityDescription: nil)
        fileIcon.contentTintColor = NSColor.white.withAlphaComponent(0.58)
        fileIcon.symbolConfiguration = NSImage.SymbolConfiguration(pointSize: 28, weight: .regular)
        fileIcon.translatesAutoresizingMaskIntoConstraints = false

        fileNameLabel.font = .systemFont(ofSize: 18, weight: .medium)
        fileNameLabel.textColor = .white
        fileNameLabel.lineBreakMode = .byTruncatingMiddle
        fileNameLabel.maximumNumberOfLines = 1

        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = NSColor.white.withAlphaComponent(0.56)

        let textStack = NSStackView(views: [fileNameLabel, statusLabel])
        textStack.orientation = .vertical
        textStack.spacing = 2
        textStack.alignment = .leading
        textStack.translatesAutoresizingMaskIntoConstraints = false

        moreLabel.font = .systemFont(ofSize: 14, weight: .regular)
        moreLabel.textColor = NSColor.white.withAlphaComponent(0.58)
        moreLabel.alignment = .right
        moreLabel.translatesAutoresizingMaskIntoConstraints = false

        removeButton.isBordered = false
        removeButton.image = NSImage(systemSymbolName: "xmark.circle.fill", accessibilityDescription: "Remove video")
        removeButton.contentTintColor = NSColor.white.withAlphaComponent(0.5)
        removeButton.target = self
        removeButton.action = #selector(removeDisplayedItem)
        removeButton.translatesAutoresizingMaskIntoConstraints = false

        addSubview(countLabel)
        addSubview(fileIcon)
        addSubview(textStack)
        addSubview(moreLabel)
        addSubview(removeButton)
        NSLayoutConstraint.activate([
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            countLabel.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            fileIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36),
            fileIcon.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 14),
            fileIcon.widthAnchor.constraint(equalToConstant: 34),
            fileIcon.heightAnchor.constraint(equalToConstant: 34),
            textStack.leadingAnchor.constraint(equalTo: fileIcon.trailingAnchor, constant: 14),
            textStack.centerYAnchor.constraint(equalTo: fileIcon.centerYAnchor),
            textStack.trailingAnchor.constraint(lessThanOrEqualTo: moreLabel.leadingAnchor, constant: -20),
            moreLabel.trailingAnchor.constraint(equalTo: removeButton.leadingAnchor, constant: -16),
            moreLabel.centerYAnchor.constraint(equalTo: fileIcon.centerYAnchor),
            removeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -34),
            removeButton.centerYAnchor.constraint(equalTo: fileIcon.centerYAnchor),
            removeButton.widthAnchor.constraint(equalToConstant: 28),
            removeButton.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    required init?(coder: NSCoder) { nil }

    func display(items: [QueueItem]) {
        guard let first = items.first else { return }
        displayedItemID = first.id
        countLabel.stringValue = "\(items.count) video\(items.count == 1 ? "" : "s") queued"
        fileNameLabel.stringValue = first.url.lastPathComponent
        statusLabel.stringValue = first.state.displayName
        moreLabel.stringValue = items.count > 1 ? "+ \(items.count - 1) more" : ""
    }

    @objc private func removeDisplayedItem() {
        guard let displayedItemID else { return }
        onRemove?(displayedItemID)
    }
}
