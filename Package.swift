// swift-tools-version:5.0
//
//  LeakDetector.swift
//  LeakDetector
//
//  Created by Steve Dao on 01/04/19.
//  Copyright © 2019 duyquang91. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "LeakDetector",
    platforms: [
        .iOS(.v8),
        .macOS(.v10_10),
        .tvOS(.v9),
        .watchOS(.v2),
    ],
    products: [
        .library(
            name: "LeakDetector",
            targets: ["LeakDetector"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0")
    ],
    targets: [
        .target(
            name: "LeakDetector",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "LeakDetectorTests",
            dependencies: ["LeakDetector"],
            path: "Tests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
