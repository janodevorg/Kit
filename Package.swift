// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "Kit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "Kit", type: .dynamic, targets: ["Kit"]),
        .library(name: "KitStatic", type: .static, targets: ["Kit"])
    ],
    dependencies: [
        .package(url: "git@github.com:apple/swift-docc-plugin.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Kit",
            dependencies: [],
            path: "sources/main",
            resources: [
                .process("resources")
            ]
        ),
        .testTarget(
            name: "KitTests",
            dependencies: ["Kit"],
            path: "sources/tests",
            resources: [
                .process("resources")
            ]
        )
    ]
)
