// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SerializeJSON",
    dependencies: [.package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.0.0")],
    targets: [
        .executableTarget(
            name: "SerializeJSON",
            dependencies: ["SwiftyJSON"],
            resources: [.process("Resources/Example.json")]
        ),
        .testTarget(name: "SerializeJSONTests", dependencies: ["SerializeJSON"])
    ]
)
