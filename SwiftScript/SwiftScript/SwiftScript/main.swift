//
//  main.swift
//  SwiftScript
//
//  Created by owen on 2018/5/13.
//  Copyright © 2018 com.tianyuchen. All rights reserved.
//

import Foundation

//
var devices = [
    "'platform=iOS Simulator,name=iPhone X,OS=11.3'",
    "'platform=iOS Simulator,name=iPhone X 2,OS=11.3'"
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

//for entry in \(test_scheme_name)/*Test.swift {
//
// }
let cwd = FileManager.default.currentDirectoryPath
print(cwd)

 
 
 
 
