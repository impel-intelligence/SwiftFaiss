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
        .library(name: "SwiftFaiss", targets: ["SwiftFaiss"])
    ],
    targets: [
        .binaryTarget(
            name: "FAISS",
            url: "https://github.com/impel-intelligence/faiss-mobile/releases/download/v1.14.3-2/faiss.xcframework.zip",
            checksum: "1ac5b9dce231e257031a26fea2c02cc54e84de8e86727e2b93800414d2b06f55"
        ),
        .binaryTarget(
            name: "FAISS_C",
            url: "https://github.com/impel-intelligence/faiss-mobile/releases/download/v1.14.3-2/faiss_c.xcframework.zip",
            checksum: "79beb58ad88baf603a7de9caf20cbb1ba68ad043d9c4c3e1f3003d7ec60d882e"
        ),
        .binaryTarget(
            name: "OpenMP",
            url: "https://github.com/impel-intelligence/openmp-mobile/releases/download/v21.1.8/openmp.xcframework.zip",
            checksum: "2f93a8273d648ab7b6d2c72c11a1684a8e63e0a1e6e6f2a326dae882d7acc20f"
        ),

//
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
                "OpenMP",
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
