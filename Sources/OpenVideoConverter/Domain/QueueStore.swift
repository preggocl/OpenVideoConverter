import Foundation

@MainActor
final class QueueStore {
    private(set) var items: [QueueItem] = []

    func append(urls: [URL]) {
        let newItems = urls
            .filter { url in !items.contains(where: { $0.url.standardizedFileURL == url.standardizedFileURL }) }
            .map { QueueItem(url: $0) }
        items.append(contentsOf: newItems)
    }

    func remove(id: UUID) {
        items.removeAll { $0.id == id }
    }
}
