//: Playground - noun: a place where people can play

import Cocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

公車.新北市.定點車機資訊 { info in
    print(info?.BusInfo.count ?? "empty")
    PlaygroundPage.current.finishExecution()
}

