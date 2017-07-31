// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Bits",
    products: [
        .library(name: "Bits", targets: ["Bits"])
    ],
    targets: [
        .target(name: "Bits"),
        .testTarget(name: "BitsTests", dependencies: ["Bits"])
    ]
)
