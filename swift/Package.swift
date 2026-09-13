// swift-tools-version:5.9
//
// BluefinDecryptxP2pe SDK - SwiftPM manifest. The runtime itself is dependency-free
// (Foundation + the vendored Voxgig Struct port under
// Sources/ProjectNameSDK/Struct); declared feature/target deps (if any)
// appear below.
import PackageDescription

let package = Package(
    name: "BluefinDecryptxP2peSdk",
    // The deployment floor. Without it SwiftPM assumes the oldest macOS the
    // toolchain still targets, and the SDK's AsyncStream-based streaming
    // (EntityBase) fails to compile on macOS with "'AsyncStream' is only
    // available in macOS 10.15 or newer" - linux has no such floor, which
    // is why the generator's own linux runs never saw it. Found by the
    // secrets lane, the first lane to build a full generated swift SDK on
    // the macos CI leg.
    platforms: [.macOS(.v10_15)],
    products: [
        .library(name: "BluefinDecryptxP2peSdk", targets: ["BluefinDecryptxP2peSdk"]),
    ],
    targets: [
        .target(
            name: "BluefinDecryptxP2peSdk",
            path: "Sources/BluefinDecryptxP2peSdk"),
        .testTarget(
            name: "Omni",
            path: "Tests/vendor/omni"),
        .testTarget(
            name: "BluefinDecryptxP2peSdkTests",
            dependencies: ["BluefinDecryptxP2peSdk", "Omni"],
            path: "Tests/BluefinDecryptxP2peSdkTests"),
    ]
)
