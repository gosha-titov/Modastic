// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modastic",
    platforms: [
      .iOS(.v13)
    ],
    products: [
        .library(
            name: "Modastic",
            type: .dynamic,
            targets: ["Modastic"]
        ),
    ],
    targets: [
        .target(
            name: "Modastic",
            path: "Sources"
        ),
        .testTarget(
            name: "ModasticTests",
            dependencies: ["Modastic"],
            path: "Tests"
        ),
    ]
)
