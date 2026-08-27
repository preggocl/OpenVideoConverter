import Testing
@testable import OpenVideoConverter

@Test func initialPresetsHaveUniqueIdentifiers() {
    let identifiers = Set(MediaPreset.initialCatalog.map(\.id))

    #expect(identifiers.count == MediaPreset.initialCatalog.count)
}
