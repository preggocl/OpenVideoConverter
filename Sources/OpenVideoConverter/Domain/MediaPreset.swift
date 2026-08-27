import Foundation

struct MediaPreset: Codable, Equatable, Hashable, Identifiable {
    let id: String
    let name: String
    let category: Category

    enum Category: String, Codable, CaseIterable {
        case online
        case compatibility
        case format

        var displayName: String {
            switch self {
            case .online: "Online"
            case .compatibility: "Compatibility"
            case .format: "Format"
            }
        }
    }

    static let initialCatalog = [
        MediaPreset(id: "web.compatibility", name: "Maximum Compatibility", category: .compatibility),
        MediaPreset(id: "web.quality", name: "High Quality Web Video", category: .online),
        MediaPreset(id: "web.small", name: "Small Web Video", category: .online),
        MediaPreset(id: "format.mp4", name: "MP4", category: .format)
    ]
}
