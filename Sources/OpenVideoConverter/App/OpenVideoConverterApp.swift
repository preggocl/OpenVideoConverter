import AppKit

@main
struct OpenVideoConverterApp {
    static func main() {
        let application = NSApplication.shared
        let delegate = ApplicationDelegate()
        application.delegate = delegate
        application.setActivationPolicy(.regular)
        application.run()
    }
}

@MainActor
private final class ApplicationDelegate: NSObject, NSApplicationDelegate {
    private var windowController: NSWindowController?

    func applicationDidFinishLaunching(_ notification: Notification) {
        let queueStore = QueueStore()
        let contentController = ConverterViewController(queueStore: queueStore)
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 940, height: 900),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.title = "Open Video Converter"
        window.minSize = NSSize(width: 740, height: 620)
        window.contentViewController = contentController
        window.setContentSize(NSSize(width: 940, height: 900))
        window.center()

        let controller = NSWindowController(window: window)
        controller.showWindow(self)
        windowController = controller
        NSApp.activate(ignoringOtherApps: true)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }
}
