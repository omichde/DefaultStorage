// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "DefaultStorage",
	products: [
		.library(name: "DefaultStorage", targets: ["DefaultStorage"]),
	],
	dependencies: [],
	targets: [
		.target(name: "DefaultStorage")
	]
)
