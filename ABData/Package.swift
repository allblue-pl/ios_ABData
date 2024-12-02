// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ABData",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ABData",
            targets: ["ABData"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../../ABDatabase/ABDatabase"),
        .package(path: "../../ABDatabase/ABLibs"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ABData",
            dependencies: ["ABDatabase","ABLibs"]),
        .testTarget(
            name: "ABDataTests",
            dependencies: ["ABData","ABDatabase","ABLibs"]),
    ]
)
