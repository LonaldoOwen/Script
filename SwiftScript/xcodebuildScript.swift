#!/usr/bin/env xcrun swift

import Foundation

//
var devices = [
    "platform=iOS Simulator,name=iPhone X,OS=11.3",
    "platform=iOS Simulator,name=iPhone X 2,OS=11.3"
]

// scheme
let test_scheme_name = "EasyPasswordUITests"
for index in 0..<devices.count {
    devices[index] = """
    xcodebuild
    -scheme \(test_scheme_name)
    -destination \(devices[index])
    """
    print(devices[index])
}

let cwd = FileManager.default.currentDirectoryPath
print(cwd)
