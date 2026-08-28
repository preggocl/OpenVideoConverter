import AppKit

@MainActor
final class ConverterViewController: NSViewController {
    private let queueStore: QueueStore
    private let dropZone = DropZoneView()
    private let queueStrip = QueueStripView()
    private let convertButton = ConverterControlButton(title: "Convert Now", style: .action)
    private var selectedPreset: MediaPreset?
    private var queueHeightConstraint: NSLayoutConstraint?

    init(queueStore: QueueStore) {
        self.queueStore = queueStore
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { nil }

    override func loadView() {
        view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(hex: 0x292B2E).cgColor
        view.widthAnchor.constraint(greaterThanOrEqualToConstant: 940).isActive = true
        view.heightAnchor.constraint(greaterThanOrEqualToConstant: 900).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let footer = ConverterFooterView()
        footer.translatesAutoresizingMaskIntoConstraints = false
        dropZone.translatesAutoresizingMaskIntoConstraints = false
        queueStrip.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dropZone)
        view.addSubview(queueStrip)
        view.addSubview(footer)
        queueHeightConstraint = queueStrip.heightAnchor.constraint(equalToConstant: 0)
        queueHeightConstraint?.isActive = true
        NSLayoutConstraint.activate([
            queueStrip.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            queueStrip.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            queueStrip.topAnchor.constraint(equalTo: view.topAnchor),
            dropZone.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dropZone.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dropZone.topAnchor.constraint(equalTo: queueStrip.bottomAnchor),
            dropZone.bottomAnchor.constraint(equalTo: footer.topAnchor),
            footer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footer.heightAnchor.constraint(equalToConstant: 292)
        ])

        dropZone.onFileURLsDropped = { [weak self] urls in self?.addFiles(urls) }
        dropZone.onChooseFiles = { [weak self] in self?.chooseFiles() }
        queueStrip.onRemove = { [weak self] id in
            self?.queueStore.remove(id: id)
            self?.updateControls()
        }
        configureFooter(in: footer)
        updateControls()
    }

    private func configureFooter(in footer: NSView) {
        let title = NSTextField(labelWithString: "Convert to")
        title.font = .systemFont(ofSize: 20, weight: .regular)
        title.textColor = NSColor.black.withAlphaComponent(0.52)
        title.translatesAutoresizingMaskIntoConstraints = false

        let online = makeMenuButton(title: "Online", options: ["YouTube 1080p", "Vimeo 1080p", "Social video"])
        let devices = makeMenuButton(title: "Devices", options: ["Apple devices", "Android devices", "Other devices"])
        let formats = makeMenuButton(title: "Format", options: MediaPreset.initialCatalog.map(\.name))
        let tools = makeMenuButton(title: "Tools", symbolName: "gearshape", options: ["Rotate left", "Rotate right", "Auto-rotate"])

        let controls = NSStackView(views: [online, devices, formats, tools])
        controls.orientation = .horizontal
        controls.spacing = 9
        controls.translatesAutoresizingMaskIntoConstraints = false
        footer.addSubview(title)
        footer.addSubview(controls)

        convertButton.target = self
        convertButton.action = #selector(convertRequested)
        convertButton.translatesAutoresizingMaskIntoConstraints = false
        footer.addSubview(convertButton)

        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 40),
            title.topAnchor.constraint(equalTo: footer.topAnchor, constant: 27),
            controls.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 40),
            controls.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 22),
            online.widthAnchor.constraint(equalToConstant: 150),
            devices.widthAnchor.constraint(equalToConstant: 165),
            formats.widthAnchor.constraint(equalToConstant: 145),
            tools.widthAnchor.constraint(equalToConstant: 135),
            online.heightAnchor.constraint(equalToConstant: 58),
            devices.heightAnchor.constraint(equalTo: online.heightAnchor),
            formats.heightAnchor.constraint(equalTo: online.heightAnchor),
            tools.heightAnchor.constraint(equalTo: online.heightAnchor),
            convertButton.centerXAnchor.constraint(equalTo: footer.centerXAnchor),
            convertButton.topAnchor.constraint(equalTo: controls.bottomAnchor, constant: 43),
            convertButton.widthAnchor.constraint(equalToConstant: 560),
            convertButton.heightAnchor.constraint(equalToConstant: 72)
        ])
    }

    private func makeMenuButton(title: String, symbolName: String? = nil, options: [String]) -> ConverterControlButton {
        let button = ConverterControlButton(title: title, symbolName: symbolName)
        let menu = NSMenu()
        for option in options {
            let item = NSMenuItem(title: option, action: #selector(presetSelected(_:)), keyEquivalent: "")
            item.target = self
            item.representedObject = option
            menu.addItem(item)
        }
        button.menu = menu
        return button
    }

    @objc private func chooseFiles() {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = true
        panel.canChooseDirectories = false
        panel.canChooseFiles = true
        panel.begin { [weak self] response in
            guard response == .OK else { return }
            self?.addFiles(panel.urls)
        }
    }

    @objc private func presetSelected(_ sender: NSMenuItem) {
        guard let title = sender.representedObject as? String else { return }
        selectedPreset = MediaPreset.initialCatalog.first(where: { $0.name == title })
        updateControls()
    }

    @objc private func convertRequested() {
        // Conversion execution is deferred until the FFmpeg integration milestone.
    }

    private func addFiles(_ urls: [URL]) {
        queueStore.append(urls: urls)
        updateControls()
    }

    private func updateControls() {
        let items = queueStore.items
        queueHeightConstraint?.constant = items.isEmpty ? 0 : QueueStripView.preferredHeight(for: items.count)
        queueStrip.isHidden = items.isEmpty
        if !items.isEmpty {
            queueStrip.display(items: items)
        }
        convertButton.isEnabled = !queueStore.items.isEmpty && selectedPreset != nil
    }
}
