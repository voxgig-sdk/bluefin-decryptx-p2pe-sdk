// swift-tools-version:5.9
//
// BluefinDecryptxP2pe SDK - SwiftPM manifest. The runtime itself is dependency-free
// (Foundation + the vendored Voxgig Struct port under
// Sources/ProjectNameSDK/Struct); declared feature/target deps (if any)
// appear below.
import PackageDescription

let package = Package(
    name: "BluefinDecryptxP2peSdk",
    products: [
        .library(name: "BluefinDecryptxP2peSdk", targets: ["BluefinDecryptxP2peSdk"]),
    ],
    targets: [
        .target(
            name: "BluefinDecryptxP2peSdk",
            path: "Sources/ProjectNameSDK"),
        .testTarget(
            name: "BluefinDecryptxP2peSdkTests",
            dependencies: ["BluefinDecryptxP2peSdk"],
            path: "Tests/ProjectNameSDKTests"),
    ]
)
