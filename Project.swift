import ProjectDescription

let project = Project(
    name: "DailyTicker",
    organizationName: "JH",
    targets: [
        // App
        .target(
            name: "App",
            destinations: .iOS,
            product: .app,
            bundleId: "com.jh.dailyticker.app",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["App/Sources/**"],
            resources: ["App/Resources/**"],
            dependencies: [
                .target(name: "HomeFeature"),
                .target(name: "StockTipFeature"),
                .target(name: "ChartFeature"),
                .target(name: "TradeFeature"),
                .target(name: "MyFeature"),
                .target(name: "DesignSystem"),
                .target(name: "API"),
                .target(name: "Repository"),
                .target(name: "Models")
            ]
        ),
        // Features
        .target(
            name: "HomeFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.jh.dailyticker.homefeature",
            sources: ["Features/HomeFeature/Sources/**"],
            resources: ["Features/HomeFeature/Resources/**"],
            dependencies: [
                .target(name: "DesignSystem"),
                .target(name: "Models"),
                .target(name: "API"),
                .target(name: "Repository")
            ]
        ),
        .target(
            name: "StockTipFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.jh.dailyticker.stocktipfeature",
            sources: ["Features/StockTipFeature/Sources/**"],
            resources: ["Features/StockTipFeature/Resources/**"],
            dependencies: [
                .target(name: "DesignSystem"),
                .target(name: "Models"),
                .target(name: "API")
            ]
        ),
        .target(
            name: "ChartFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.jh.dailyticker.chartfeature",
            sources: ["Features/ChartFeature/Sources/**"],
            resources: ["Features/ChartFeature/Resources/**"],
            dependencies: [
                .target(name: "DesignSystem"),
                .target(name: "Models"),
                .target(name: "API")
            ]
        ),
        .target(
            name: "TradeFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.jh.dailyticker.tradefeature",
            sources: ["Features/TradeFeature/Sources/**"],
            resources: ["Features/TradeFeature/Resources/**"],
            dependencies: [
                .target(name: "DesignSystem"),
                .target(name: "Models"),
                .target(name: "API"),
                .target(name: "Repository")
            ]
        ),
        .target(
            name: "MyFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.jh.dailyticker.myfeature",
            sources: ["Features/MyFeature/Sources/**"],
            resources: ["Features/MyFeature/Resources/**"],
            dependencies: [
                .target(name: "DesignSystem"),
                .target(name: "Models")
            ]
        ),
        // Core
        .target(
            name: "API",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.jh.dailyticker.api",
            sources: ["Core/API/Sources/**"],
            dependencies: [
                .target(name: "Models"),
                .target(name: "Network")
            ]
        ),
        .target(
            name: "Network",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.jh.dailyticker.network",
            sources: ["Core/Network/Sources/**"]
        ),
        .target(
            name: "Repository",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.jh.dailyticker.repository",
            sources: ["Core/Repository/Sources/**"],
            dependencies: [
                .target(name: "API"),
                .target(name: "Models")
            ]
        ),
        .target(
            name: "Models",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.jh.dailyticker.models",
            sources: ["Core/Models/Sources/**"]
        ),
        .target(
            name: "DesignSystem",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.jh.dailyticker.designsystem",
            sources: ["Core/DesignSystem/Sources/**"],
            resources: ["Core/DesignSystem/Resources/**"]
        ),
        // App tests
        .target(
            name: "AppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.jh.dailyticker.apptests",
            infoPlist: .default,
            sources: ["App/Tests/**"],
            dependencies: [
                .target(name: "App")
            ]
        ),
    ]
)
