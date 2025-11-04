// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftCommonKit",
  platforms: [.macOS(.v14), .iOS(.v14)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    // .library(
    //   name: "SwiftCommonKit",
    //   targets: ["SwiftCommonKit"])
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "FoundationExt"),
    .testTarget(
      name: "FoundationExtTests",
      dependencies: ["FoundationExt"]
    ),
  ]
)
