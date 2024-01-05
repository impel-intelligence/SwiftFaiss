// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "swift-faiss",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10)
    ],
    products: [
        .library(name: "SwiftFaiss", targets: ["SwiftFaiss"]),
        .executable(name: "swift-faiss", targets: ["SwiftFaissCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/jkrukowski/FaissMobile", from: "0.0.1"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.50.4")
    ],
    targets: [
        .executableTarget(
            name: "SwiftFaissCLI",
            dependencies: [
                .target(name: "SwiftFaiss"),
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            plugins: [
                .plugin(
                    name: "SwiftFormat",
                    package: "SwiftFormat"
                )
            ]
        ),
        .target(
            name: "SwiftFaiss",
            dependencies: [
                .target(name: "SwiftFaissC")
            ],
            plugins: [
                .plugin(
                    name: "SwiftFormat",
                    package: "SwiftFormat"
                )
            ]
        ),
        .target(
            name: "SwiftFaissC",
            dependencies: [
                .product(name: "FAISS", package: "FaissMobile"),
                .product(name: "FAISS_C", package: "FaissMobile"),
                .product(name: "OpenMP", package: "FaissMobile"),
            ]
        ),
        .testTarget(
            name: "SwiftFaissTests",
            dependencies: [
                .target(name: "SwiftFaiss")
            ]
        )
    ]
)