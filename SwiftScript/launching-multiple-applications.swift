#!/usr/bin/env xcrun swift

// 通过Swift script打开Mac applications
import Cocoa

var count = CommandLine.argc

print("Number of arguments is \(count)")

var workMode : Array = ["Android Studio", "XCode"]
var readMode : Array = ["Google Chrome", "Notes","iBooks","A"]
var myDictionary = [String: Array<String>]()

myDictionary["work"] = workMode
myDictionary["read"] = readMode


if count > 1
{
    
    let key = CommandLine.arguments[1]
    
    let apps = myDictionary[key]
    if apps?.count != nil{
        let myWorkspace = NSWorkspace.shared
        for s in apps! {
            myWorkspace.launchApplication(s)
        }
    }
    else{
        print("Incorrect command")
    }
}
else{
    print("Missing command")
}
