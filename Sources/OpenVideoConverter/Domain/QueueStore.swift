import Foundation

@MainActor
final class QueueStore {
    private(set) var items: [QueueItem] = []

    func append(urls: [URL]) {
        var knownURLs = Set(items.map { $0.url.standardizedFileURL })
        let newItems = urls.compactMap { url -> QueueItem? in
            let standardizedURL = url.standardizedFileURL
            guard knownURLs.insert(standardizedURL).inserted else { return nil }
            return QueueItem(url: url)
        }
        items.append(contentsOf: newItems)
    }

    func remove(id: UUID) {
        items.removeAll { $0.id == id }
    }
}
