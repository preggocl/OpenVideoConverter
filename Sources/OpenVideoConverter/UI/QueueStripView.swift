import AppKit

final class QueueStripView: NSView {
    var onRemove: ((UUID) -> Void)?

    private let countLabel = NSTextField(labelWithString: "")
    private let remainingLabel = NSTextField(labelWithString: "")
    private let rows = NSStackView()

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
        layer?.backgroundColor = NSColor(hex: 0x34373A).cgColor

        countLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        countLabel.textColor = NSColor.white.withAlphaComponent(0.72)
        countLabel.translatesAutoresizingMaskIntoConstraints = false

        remainingLabel.font = .systemFont(ofSize: 13, weight: .regular)
        remainingLabel.textColor = NSColor.white.withAlphaComponent(0.52)
        remainingLabel.alignment = .right
        remainingLabel.translatesAutoresizingMaskIntoConstraints = false

        rows.orientation = .vertical
        rows.spacing = 0
        rows.translatesAutoresizingMaskIntoConstraints = false

        addSubview(countLabel)
        addSubview(remainingLabel)
        addSubview(rows)
        NSLayoutConstraint.activate([
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            countLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            remainingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            remainingLabel.centerYAnchor.constraint(equalTo: countLabel.centerYAnchor),
            rows.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            rows.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            rows.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 8),
            rows.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) { nil }

    static func preferredHeight(for itemCount: Int) -> CGFloat {
        42 + CGFloat(min(itemCount, 3)) * 58
    }

    func display(items: [QueueItem]) {
        rows.arrangedSubviews.forEach {
            rows.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }

        countLabel.stringValue = "\(items.count) video\(items.count == 1 ? "" : "s") queued"
        remainingLabel.stringValue = items.count > 3 ? "Showing first 3" : ""
        for item in items.prefix(3) {
            let row = QueueRowView(item: item)
            row.onRemove = { [weak self] id in self?.onRemove?(id) }
            rows.addArrangedSubview(row)
            row.heightAnchor.constraint(equalToConstant: 58).isActive = true
        }
    }
}

private final class QueueRowView: NSView {
    var onRemove: ((UUID) -> Void)?
    private let itemID: UUID

    init(item: QueueItem) {
        itemID = item.id
        super.init(frame: .zero)
        wantsLayer = true
        layer?.borderColor = NSColor.white.withAlphaComponent(0.09).cgColor
        layer?.borderWidth = 0.5

        let icon = NSImageView()
        icon.image = NSImage(systemSymbolName: "film", accessibilityDescription: nil)
        icon.contentTintColor = NSColor.white.withAlphaComponent(0.56)
        icon.symbolConfiguration = NSImage.SymbolConfiguration(pointSize: 22, weight: .regular)
        icon.translatesAutoresizingMaskIntoConstraints = false

        let name = NSTextField(labelWithString: item.url.lastPathComponent)
        name.font = .systemFont(ofSize: 16, weight: .medium)
        name.textColor = .white
        name.lineBreakMode = .byTruncatingMiddle
        name.maximumNumberOfLines = 1

        let status = NSTextField(labelWithString: item.state.displayName)
        status.font = .systemFont(ofSize: 13, weight: .regular)
        status.textColor = NSColor.white.withAlphaComponent(0.52)

        let labels = NSStackView(views: [name, status])
        labels.orientation = .vertical
        labels.spacing = 1
        labels.alignment = .leading
        labels.translatesAutoresizingMaskIntoConstraints = false

        let remove = NSButton(title: "", target: self, action: #selector(removeItem))
        remove.isBordered = false
        remove.image = NSImage(systemSymbolName: "xmark.circle.fill", accessibilityDescription: "Remove video")
        remove.contentTintColor = NSColor.white.withAlphaComponent(0.48)
        remove.translatesAutoresizingMaskIntoConstraints = false

        addSubview(icon)
        addSubview(labels)
        addSubview(remove)
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 28),
            labels.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            labels.centerYAnchor.constraint(equalTo: centerYAnchor),
            labels.trailingAnchor.constraint(equalTo: remove.leadingAnchor, constant: -16),
            remove.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            remove.centerYAnchor.constraint(equalTo: centerYAnchor),
            remove.widthAnchor.constraint(equalToConstant: 28),
            remove.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    required init?(coder: NSCoder) { nil }

    @objc private func removeItem() {
        onRemove?(itemID)
    }
}
