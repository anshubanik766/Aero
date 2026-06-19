import PackageDescription

let package = Package(
    name: "Aero",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/DiscordBM/DiscordBM.git", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "Aero",
            dependencies: [
                .product(name: "DiscordBM", package: "DiscordBM")
            ]
        )
    ]
)
