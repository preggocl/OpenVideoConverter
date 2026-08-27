// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "OpenVideoConverter",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "OpenVideoConverter", targets: ["OpenVideoConverter"])
    ],
    targets: [
        .executableTarget(name: "OpenVideoConverter"),
        .testTarget(name: "OpenVideoConverterTests", dependencies: ["OpenVideoConverter"])
    ]
)
