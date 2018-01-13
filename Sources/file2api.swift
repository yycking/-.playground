import Foundation

func file2api() {
    print("""
import Foundation
public typealias Number = Int

public class 公車 {
    private let host = "https://tcgbusfs.blob.core.windows.net"
    private let city: String
    private init(string: String) {
    self.city = string
    }
    
    public static let 臺北市 = 公車(string: "blobbus")
    public static let 新北市 = 公車(string: "ntpcbus")
    
    func call<T>(url: String, complete:@escaping (_ object:T?)->Void) where T:Decodable {
    let link = URL(string: "\\(host)/\\(city)/Get\\(url).gz")
    let task = URLSession.shared.dataTask(with: link!) { (data, response, error) in
    guard
    let gzdata = data,
    let jsonData = gzdata.gunzipped(),
    let json = String(data: jsonData, encoding: String.Encoding.utf8)
    else {
    complete(nil)
    return
    }
    let object = try? JSONDecoder().decode(T.self, from: jsonData)
    complete(object)
    
    }
    task.resume()
    }
public class TBLocation: Decodable {
    public let name: String
    public let CenterName: String
}

public class TBEssentialInfo: Decodable {
    public let Location: TBLocation
    public let UpdateTime: String
    public let CoordinateSystem: String
""")
    if
        let path = Bundle.main.path(forResource: "File", ofType: "md"),
        let content = try? String(contentsOfFile: path) {
        let lines = content.split(separator: "\n")
        var skip = false
        var funcName = ""
        var path = ""
        for line in lines {
            if skip {
                skip = false
                continue
            }
            var string = line.replacingOccurrences(of: " ", with: "")
            string = string.replacingOccurrences(of: "、", with: "")
            let texts = string.split(separator: "|")
            
            if texts.count < 2 {
                continue
            }
            
            if texts.first!.hasPrefix("-") {
                skip = true
                continue
            }
            
            if texts.count == 2 {
                if path != String(texts.first!) {
                    path = String(texts[0])
                    funcName = String(texts[1])
                    print("""
                        }
                        
                        public class TB\(path): Decodable {
                        \tpublic let EssentialInfo: TBEssentialInfo
                        \tpublic let BusInfo: [TB\(path)Info]
                        }
                        
                        public func \(funcName)(complete:@escaping (_ info: TB\(path)?)->Void) {
                        \tcall(url: "\(path)", complete: complete)
                        }
                        
                        public class TB\(path)Info: Decodable {
                        """)
                }
                continue
            }
            var name = String(texts[0])
            if name == "Type" {
                name = "`Type`"
            }
            print("\tpublic let \(name): \(String(texts[1])) // \(String(texts[2]))")
        }
    }
    print("}}")
}
