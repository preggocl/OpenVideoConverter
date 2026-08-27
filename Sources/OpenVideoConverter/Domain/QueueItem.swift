import Foundation

struct QueueItem: Identifiable, Equatable {
    enum State: String, Equatable {
        case queued
        case analyzing
        case ready
        case converting
        case completed
        case failed
        case cancelled

        var displayName: String {
            rawValue.capitalized
        }

        func canTransition(to next: State) -> Bool {
            switch (self, next) {
            case (.queued, .analyzing), (.queued, .cancelled),
                 (.analyzing, .ready), (.analyzing, .failed), (.analyzing, .cancelled),
                 (.ready, .converting), (.ready, .cancelled),
                 (.converting, .completed), (.converting, .failed), (.converting, .cancelled):
                true
            default:
                false
            }
        }
    }

    let id: UUID
    let url: URL
    private(set) var state: State

    init(url: URL, state: State = .queued) {
        self.id = UUID()
        self.url = url
        self.state = state
    }

    mutating func transition(to next: State) -> Bool {
        guard state.canTransition(to: next) else { return false }
        state = next
        return true
    }
}
