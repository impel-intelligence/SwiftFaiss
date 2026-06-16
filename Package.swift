// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "swift-faiss",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "SwiftFaiss", targets: ["SwiftFaiss"]),
        .library(
            name: "FAISS",
            targets: ["FAISS"]
        ),
        .library(
            name: "FAISS_C",
            targets: ["FAISS_C"]
        ),
        .library(
            name: "OpenMP",
            targets: ["OpenMP"]
        )
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
                "FAISS",
                "FAISS_C",
                "OpenMP"
            ]
        ),
        .testTarget(
            name: "SwiftFaissTests",
            dependencies: [
                .target(name: "SwiftFaiss")
            ]
        ),
        
        .binaryTarget(
            name: "FAISS",
            url: "https://github.com/impel-intelligence/faiss-mobile/releases/download/v1.14.3/faiss.xcframework.zip",
            checksum: "d102e5b46fe48cdd754870c16fe3a0f7220fba136b48c4febcdc30809fa8b7ec"
        ),
        .binaryTarget(
            name: "FAISS_C",
            url: "https://github.com/impel-intelligence/faiss-mobile/releases/download/v1.14.3/faiss_c.xcframework.zip",
            checksum: "664e84f393929d5d0a10f164b3c2ea6b4636b604de68095e77f2fd08bdb32063"
        ),
        .binaryTarget(
            name: "OpenMP",
            url: "https://github.com/impel-intelligence/openmp-mobile/releases/download/v21.1.8/openmp.xcframework.zip",
            checksum: "2f93a8273d648ab7b6d2c72c11a1684a8e63e0a1e6e6f2a326dae882d7acc20f"
        )
    ]
)
