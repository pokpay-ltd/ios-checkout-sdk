// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "POKCheckoutSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "POK",
            targets: ["POKTarget"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/socketio/socket.io-client-swift", .upToNextMinor(from: "15.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
          name: "POKTarget",
          dependencies: [.target(name: "POKWrapper")],
          path: "POKTarget"
        ),
        .target(
          name: "POKWrapper",
          dependencies:[
              .target(name: "POK"),
              .target(name: "RLTMXBehavioralBiometrics"),
              .target(name: "RLTMXProfiling"),
              .target(name: "RLTMXProfilingConnections"),
              .product(name: "SocketIO", package: "socket.io-client-swift")
          ],
          path: "POKWrapper"
        ),
        .binaryTarget(
          name: "POK",
          path: "./Sources/POK.xcframework"
        ),
        .binaryTarget(
          name: "RLTMXProfiling",
          path: "./Sources/RLTMXProfiling.xcframework"
        ),
        .binaryTarget(
          name: "RLTMXProfilingConnections",
          path: "./Sources/RLTMXProfilingConnections.xcframework"
        ),
        .binaryTarget(
          name: "RLTMXBehavioralBiometrics",
          path: "./Sources/RLTMXBehavioralBiometrics.xcframework"
        ),
    ]
)
