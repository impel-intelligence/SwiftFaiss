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
        .library(name: "SwiftFaiss", targets: ["SwiftFaiss"])
    ],
    dependencies: [
        .package(url: "https://github.com/jkrukowski/FaissMobile", from: "0.0.1")
    ],
    targets: [
        .target(
            name: "SwiftFaiss",
            dependencies: [
                .target(name: "SwiftFaissC")
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
