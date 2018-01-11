//: Playground - noun: a place where people can play

import Cocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true



var url = URL(string: "https://tcgbusfs.blob.core.windows.net/blobbus/GetEstimateTime.gz")
var task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
    guard
        let gzdata = data,
        let jsonData = gzdata.gunzipped(),
        let json = String(data: jsonData, encoding: String.Encoding.utf8)
        else {return}
    print(json)
    PlaygroundPage.current.finishExecution()
}

task.resume()

