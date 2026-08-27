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
