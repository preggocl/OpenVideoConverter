import Foundation
import Testing
@testable import OpenVideoConverter

@Test func queueItemRejectsInvalidStateTransition() {
    var item = QueueItem(url: URL(fileURLWithPath: "/tmp/input.mov"))
    let accepted = item.transition(to: .completed)

    #expect(accepted == false)
    #expect(item.state == .queued)
}

@Test func queueItemAllowsExpectedConversionFlow() {
    var item = QueueItem(url: URL(fileURLWithPath: "/tmp/input.mov"))
    let startedAnalysis = item.transition(to: .analyzing)
    let becameReady = item.transition(to: .ready)
    let startedConversion = item.transition(to: .converting)
    let completed = item.transition(to: .completed)

    #expect(startedAnalysis)
    #expect(becameReady)
    #expect(startedConversion)
    #expect(completed)
}

@Test @MainActor func queueStoreDeduplicatesAndRemovesFiles() {
    let store = QueueStore()
    let firstURL = URL(fileURLWithPath: "/tmp/first.mov")
    let secondURL = URL(fileURLWithPath: "/tmp/second.mov")

    store.append(urls: [firstURL, firstURL, secondURL])
    #expect(store.items.count == 2)

    store.remove(id: store.items[0].id)
    #expect(store.items.count == 1)
    #expect(store.items[0].url == secondURL)
}
