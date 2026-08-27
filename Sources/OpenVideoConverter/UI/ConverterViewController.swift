import AppKit

@MainActor
final class ConverterViewController: NSViewController {
    private let queueStore: QueueStore
    private let queueLabel = NSTextField(labelWithString: "No videos queued")
    private let presetPicker = NSPopUpButton(frame: .zero, pullsDown: false)
    private let convertButton = NSButton(title: "Convert Now", target: nil, action: nil)

    init(queueStore: QueueStore) {
        self.queueStore = queueStore
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        nil
    }

    override func loadView() {
        view = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let stack = NSStackView()
        stack.orientation = .vertical
        stack.spacing = 16
        stack.edgeInsets = NSEdgeInsets(top: 22, left: 22, bottom: 22, right: 22)
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.topAnchor.constraint(equalTo: view.topAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        queueLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        stack.addArrangedSubview(queueLabel)

        let dropZone = DropZoneView()
        dropZone.onFileURLsDropped = { [weak self] urls in
            self?.addFiles(urls)
        }
        dropZone.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(dropZone)
        dropZone.heightAnchor.constraint(greaterThanOrEqualToConstant: 260).isActive = true

        let controls = NSStackView()
        controls.orientation = .horizontal
        controls.spacing = 10
        controls.alignment = .centerY

        let chooseButton = NSButton(title: "Choose Files…", target: self, action: #selector(chooseFiles))
        controls.addArrangedSubview(chooseButton)

        presetPicker.addItem(withTitle: "Convert to")
        presetPicker.menu?.items.first?.isEnabled = false
        presetPicker.addItems(withTitles: MediaPreset.initialCatalog.map(\.name))
        presetPicker.target = self
        presetPicker.action = #selector(presetChanged)
        controls.addArrangedSubview(presetPicker)

        convertButton.isEnabled = false
        controls.addArrangedSubview(convertButton)
        stack.addArrangedSubview(controls)
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

    @objc private func presetChanged() {
        updateControls()
    }

    private func addFiles(_ urls: [URL]) {
        queueStore.append(urls: urls)
        updateControls()
    }

    private func updateControls() {
        let count = queueStore.items.count
        queueLabel.stringValue = count == 0 ? "No videos queued" : "\(count) video\(count == 1 ? "" : "s") queued"
        convertButton.isEnabled = count > 0 && presetPicker.indexOfSelectedItem > 0
    }
}
