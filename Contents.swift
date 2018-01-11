//: Playground - noun: a place where people can play

import Cocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

public class 公車 {
    private let host = "https://tcgbusfs.blob.core.windows.net"
    private let city: String
    private init(string: String) {
        self.city = string
    }
    
    public static let 臺北市 = 公車(string: "blobbus")
    public static let 新北市 = 公車(string: "ntpcbus")
    
    func call<T>(url: String, type: T.Type, complete:@escaping (_ object:T?)->Void) where T:Decodable {
        let link = URL(string: "\(host)/\(city)/\(url)")
        let task = URLSession.shared.dataTask(with: link!) { (data, response, error) in
            guard
                let gzdata = data,
                let jsonData = gzdata.gunzipped(),
                let json = String(data: jsonData, encoding: String.Encoding.utf8)
                else {
                    complete(nil)
                    return
            }
            let object = try? JSONDecoder().decode(type, from: jsonData)
            complete(object)
            
        }
        task.resume()
    }
    
    func 附屬路線與路線對應資訊(complete:@escaping (_ bstimateTime:TBEstimateTime?)->Void) {
        call(url: "GetEstimateTime.gz", type: TBEstimateTime.self, complete: complete)
    }
}

公車.臺北市.附屬路線與路線對應資訊 { bstimateTime in
    print(bstimateTime?.BusInfo.count ?? "empty")
    PlaygroundPage.current.finishExecution()
}


