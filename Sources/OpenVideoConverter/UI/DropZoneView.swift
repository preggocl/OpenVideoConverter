import AppKit

final class DropZoneView: NSView {
    var onFileURLsDropped: (([URL]) -> Void)?

    private let messageLabel = NSTextField(labelWithString: "Drag videos here or Choose Files…")

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
        layer?.backgroundColor = NSColor.windowBackgroundColor.withAlphaComponent(0.7).cgColor
        layer?.cornerRadius = 10
        registerForDraggedTypes([.fileURL])

        messageLabel.font = .systemFont(ofSize: 18, weight: .medium)
        messageLabel.textColor = .secondaryLabelColor
        messageLabel.alignment = .center
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        nil
    }

    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        .copy
    }

    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        let urls = sender.draggingPasteboard.readObjects(forClasses: [NSURL.self], options: nil) as? [URL] ?? []
        guard !urls.isEmpty else { return false }
        onFileURLsDropped?(urls)
        return true
    }
}
