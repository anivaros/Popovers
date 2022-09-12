// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Popovers",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Popovers",
            targets: ["Popovers"]
        )
    ],
    targets: [
        .target(
            name: "Popovers",
            dependencies: [],
            path: "Sources"
        )
    ]
)
