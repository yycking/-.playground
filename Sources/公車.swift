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
        let link = URL(string: "\(host)/\(city)/Get\(url).gz")
        let task = URLSession.shared.dataTask(with: link!) { (data, response, error) in
            guard
                let gzdata = data,
                let jsonData = gzdata.gunzipped()
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
    }
    
    public class TBBusData: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBBusDataInfo]
    }
    
    public func 定時車機資訊(complete:@escaping (_ info: TBBusData?)->Void) {
        call(url: "BusData", complete: complete)
    }
    
    public class TBBusDataInfo: Decodable {
        public let StationID: Number // 該車輛所屬之場站代碼
        public let CarType: String // 車輛類型:0:一般1:低底盤2:大復康巴士3:圓仔公車
        public let BusID: String // 公車車牌號碼
        public let ProviderID: Number // 公車業者代碼
        public let CarID: Number // 公車代碼
        public let DutyStatus: String // 勤務狀態(0:正常1:開始2:結束)
        public let BusStatus: String // 行車狀態(0:正常1:車禍2:故障3:塞車4:緊急求援5:加油99:非營運狀態)
        public let RouteID: String // 服務路線代碼(附屬路線ID)
        public let GoBack: String // 去返程(0:去程1:回程2:未知)
        public let Longitude: String // 經度/X座標
        public let Latitude: String // 緯度/Y座標
        public let Speed: String // GPS速度(Km/Hr)
        public let Azimuth: String // 行車方位角
        public let DataTime: String // 本筆資料觸發時間
    }
    
    public class TBBusEvent: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBBusEventInfo]
    }
    
    public func 定點車機資訊(complete:@escaping (_ info: TBBusEvent?)->Void) {
        call(url: "BusEvent", complete: complete)
    }
    
    public class TBBusEventInfo: Decodable {
        public let StationID: Number // 該車輛所屬之場站代碼
        public let CarType: String // 車輛類型:0:一般1:低底盤2:大復康巴士3:圓仔公車
        public let BusID: String // 公車車牌號碼
        public let ProviderID: Number // 公車業者代碼
        public let CarID: Number // 公車代碼
        public let DutyStatus: String // 勤務狀態(0:正常1:開始2:結束)
        public let BusStatus: String // 行車狀態(0:正常1:車禍2:故障3:塞車4:緊急求援5:加油99:非營運狀態)
        public let RouteID: String // 服務路線代碼(附屬路線ID)
        public let GoBack: String // 去返程(0:去程1:回程2:未知)
        public let StopID: String // 公車所在位置之站牌代碼
        public let CarOnStop: String // 到離站狀態(0:離站1:進站)
        public let DataTime: String // 本筆資料觸發時間
    }
    
    public class TBCarInfo: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBCarInfoInfo]
    }
    
    public func 車輛基本資訊(complete:@escaping (_ info: TBCarInfo?)->Void) {
        call(url: "CarInfo", complete: complete)
    }
    
    public class TBCarInfoInfo: Decodable {
        public let BusId: Number // 主索引/查詢代碼
        public let CarNum: String // 牌照號碼
        public let CarType: String // 車輛類型:0:一般1:低底盤2:大復康巴士3:圓仔公車
        public let IboxId: Number // 車機ID
        public let StationId: Number // 所屬營業站ID(調度站ID)
        public let PathAttributeId: Number // 所屬附屬路線ID
        public let BuildPeriod: String // 建置時間，分為1:1期2:2期3:3期9:非動態資料10:北縣
        public let Ctime: String // 建立時間
    }
    
    public class TBCarUnusual: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBCarUnusualInfo]
    }
    
    public func 車機異常資訊(complete:@escaping (_ info: TBCarUnusual?)->Void) {
        call(url: "CarUnusual", complete: complete)
    }
    
    public class TBCarUnusualInfo: Decodable {
        public let BusID: Number // 車輛代碼
        public let StatusCode: Number // 異常狀態代碼(0正常1:斷線2:LED顯示器斷線3:異常停留4:路線外營運)
    }
    
    public class TBEstimateTime: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBEstimateTimeInfo]
    }
    
    public func 預估到站時間(complete:@escaping (_ info: TBEstimateTime?)->Void) {
        call(url: "EstimateTime", complete: complete)
    }
    
    public class TBEstimateTimeInfo: Decodable {
        public let RouteID: Number // 路線代碼(主路線ID)
        public let StopID: Number // 站牌代碼
        public let EstimateTime: String // 預估到站剩餘時間(單位:秒)-1:尚未發車-2:交管不停靠-3:末班車已過-4:今日未營運
        public let GoBack: String // 去返程(0:去程1:返程2:尚未發車3:末班已駛離)
    }
    
    public class TBIStop: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBIStopInfo]
    }
    
    public func 智慧型站牌(complete:@escaping (_ info: TBIStop?)->Void) {
        call(url: "IStop", complete: complete)
    }
    
    public class TBIStopInfo: Decodable {
        public let Id: Number // 主索引
        public let SimCardNum: String // SIM卡編號
        public let DeviceId: Number // 智慧型站牌編號(站牌車機號碼15碼)
        public let StopCname: String // 站牌中文名稱
        public let StopEname: String // 站牌英文名稱
        public let QueryCode: String // 站牌查詢代碼(4碼)
        public let Provider: String // 站牌建置廠商者區分期別(1:1期2:2期3:3期)
        public let StopId: String // 站牌編號
        public let Longitude: String // 經度(WGS84，以度為單位)
        public let Latitude: String // 緯度(WGS84，以度為單位)
        public let Address: String // 智慧型站牌地址
        public let TypeId: Number // 站牌型別編號
        public let FirmwarfeVersion: String // 韌體版本(向站牌車機詢問)
        public let BootTime: String // 預設開機時間
        public let ShutdownTime: String // 預設關機時間
        public let MessageGroupId: Number // 訊息群組編號
        public let DefaultMessage: String // 預設訊息
        public let BootMessage: String // 開機訊息
        public let LanguageMode: String // 多語系顯示模式0:關閉英文1:開啟英文
        public let DisplaySpeed: String // 顯示速度0~9
        public let DistanceFunctionMode: String // 站距功能開關0:關閉1:開啟
        public let IsShowQcode: String // 顯示站牌查詢代碼開關0:關閉1:開啟
        public let IsShowStopName: String // 顯示站牌名稱開關0:關閉1:開啟
        public let IsShowDirectionLocation: String // `顯示方向及車輛所在位置開關`
        public let IsShowTrafficStatus: String // 是否顯示行車狀況(0:不顯示/1:顯示)
        public let IsShowArrivingInfo: String // 是否顯示進站中資訊(0:不顯示/1:顯示)
        public let VcId: Number // 通訊伺服器ID
        public let BuildPeriod: String // 建置時間，分為1:1期2:2期3:3期9:非動態資料10:北縣
        public let Memo: String // 備註
        public let Ctime: String // 建立時間
    }
    
    public class TBIStopPath: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBIStopPathInfo]
    }
    
    public func 智慧型站牌所屬路線(complete:@escaping (_ info: TBIStopPath?)->Void) {
        call(url: "IStopPath", complete: complete)
    }
    
    public class TBIStopPathInfo: Decodable {
        public let Id: Number // 主索引
        public let IStopId: Number // 路線設定名稱
        public let PathId: Number // 路線編號
        public let StopId: Number // 站牌編號
        public let Sequence: Number // 路線顯示之順序
    }
    
    public class TBOrgPathAttribute: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBOrgPathAttributeInfo]
    }
    
    public func 路線營業站對應(complete:@escaping (_ info: TBOrgPathAttribute?)->Void) {
        call(url: "OrgPathAttribute", complete: complete)
    }
    
    public class TBOrgPathAttributeInfo: Decodable {
        public let Id: Number // 主索引
        public let OrganizationId: Number // 營業站ID
        public let PathAttributeId: Number // 附屬路線ID
    }
    
    public class TBPathDetail: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBPathDetailInfo]
    }
    
    public func 附屬路線與路線對應資訊(complete:@escaping (_ info: TBPathDetail?)->Void) {
        call(url: "PathDetail", complete: complete)
    }
    
    public class TBPathDetailInfo: Decodable {
        public let Id: Number // 主索引
        public let PathAttributeId: Number // 附屬路線ID
        public let StopId: Number // 站牌ID
        public let SequenceNo: Number // 站序
        public let `Type`: String // 類別:0:正常CPT:控制點)
        public let TypeAttribute: String // 類別屬性描述(例如控制點時間之描述)
    }
    
    public class TBProvider: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBProviderInfo]
    }
    
    public func 業者營運基本資料(complete:@escaping (_ info: TBProvider?)->Void) {
        call(url: "Provider", complete: complete)
    }
    
    public class TBProviderInfo: Decodable {
        public let id: Number // 業者代碼
        public let nameZn: String // 業者中文名稱
        public let nameEn: String // 業者英文名稱
        public let email: String // 電子信箱
        public let phoneInfo: String // 服務電話
        public let stationId: Number // 營業站(調度站)代碼
        public let stationNameZn: String // `營業站(調度站)中文名稱`
        public let stationNameEn: String // `營業站(調度站)英文名稱`
        public let type: String // 營運種類(0:市區公車1:公路客運2:捷運3:火車4:航空客運5:船運)
    }
    
    public class TBRoute: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBRouteInfo]
    }
    
    public func 路線(complete:@escaping (_ info: TBRoute?)->Void) {
        call(url: "Route", complete: complete)
    }
    
    public class TBRouteInfo: Decodable {
        public let Id: Number // 路線代碼
        public let providerId: Number // 業者代碼
        public let providerName: String // 業者中文名稱
        public let nameZh: String // 中文名稱
        public let nameEn: String // 英文名稱
        public let pathAttributeId: Number // 所屬附屬路線ID
        public let pathAttributeName: String // 所屬附屬路線中文名稱
        public let pathAttributeEname: String // 所屬附屬路線英文名稱
        public let buildPeriod: String // 建置時間，分為1:1期2:2期3:3期9:非動態資料10:北縣
        public let departureZh: String // '去程第1站'起站中文名稱
        public let departureEn: String // '去程第1站'起站英文名稱
        public let destinationZh: String // '回程第1站'訖站中文名稱
        public let destinationEn: String // '回程第1站'訖站英文名稱
        public let realSequence: String // 核定總班次
        public let distance: String // 總往返里程(公里/全程)
        public let goFirstBusTime: String // 站牌顯示時使用，去程第一班發車時間(hhmm)
        public let backFirstBusTime: String // 站牌顯示時使用，回程第一班發車時間(hhmm)
        public let goLastBusTime: String // 站牌顯示時使用，去程最後一班發車時間(hhmm)
        public let backLastBusTime: String // 站牌顯示時使用，回程最後一班發車時間(hhmm)
        public let peakHeadway: String // 站牌顯示時使用，尖峰時段發車間隔(hhmmORmm)
        public let offPeakHeadway: String // 站牌顯示時使用，離峰時段發車間隔(hhmmORmm)
        public let busTimeDesc: String // 平日頭末班描述
        public let holidayGoFirstBusTime: String // 假日站牌顯示時使用，去程第一班發車時間(HHmm)
        public let holidayBackFirstBusTime: String // 假日站牌顯示時使用，回程第一班發車時間(HHmm)
        public let holidayGoLastBusTime: String // 假日站牌顯示時使用，去程最後一班發車時間(HHmm)
        public let holidayBackLastBusTime: String // 假日站牌顯示時使用，回程最後一班發車時間(HHmm)
        public let holidayBusTimeDesc: String // 假日頭末班描述
        public let headwayDesc: String // 平日發車間距描述
        public let holidayPeakHeadway: String // 假日站牌顯示時使用，尖峰時段發車間隔(mmmmORmm)
        public let holidayOffPeakHeadway: String // 假日站牌顯示時使用，離峰時段發車間隔(mmmmORmm)
        public let holidayHeadwayDesc: String // 假日發車間距描述
        public let segmentBufferZh: String // 分段緩衝區(中文)
        public let segmentBufferEn: String // 分段緩衝區(英文)
        public let ticketPriceDescriptionZh: String // 票價描述(中文)
        public let ticketPriceDescriptionEn: String // 票價描述(英文)
        public let aliasName: String // 路線別名
    }
    
    public class TBStop: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBStopInfo]
    }
    
    public func 站牌(complete:@escaping (_ info: TBStop?)->Void) {
        call(url: "Stop", complete: complete)
    }
    
    public class TBStopInfo: Decodable {
        public let Id: Number // 站牌代碼
        public let routeId: Number // 所屬路線代碼(主路線ID)
        public let nameZh: String // 中文名稱
        public let nameEn: String // 英文名稱
        public let seqNo: Number // 於路線上的順序
        public let pgp: String // 上下車站別(-1:可下車0:可上下車1:可上車)
        public let goBack: String // 去返程(0:去程/1:返程/2:未知)
        public let longitude: String // 經度
        public let latitude: String // 緯度
        public let address: String // 地址
        public let stopLocationId: Number // 站位ID
        public let showLon: String // 顯示用經度
        public let showLat: String // 顯示用緯度
        public let vector: String // 向量角:0~359，預設為空白
    }
    
    public class TBSemiTimeTable: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBSemiTimeTableInfo]
    }
    
    public func 機動班次時刻表(complete:@escaping (_ info: TBSemiTimeTable?)->Void) {
        call(url: "SemiTimeTable", complete: complete)
    }
    
    public class TBSemiTimeTableInfo: Decodable {
        public let Id: Number // 主索引/查詢代碼
        public let PathAttributeId: Number // 附屬路線ID
        public let StartTime: String // 尖離峰時間(起)
        public let EndTime: String // 尖離峰時間(迄)
        public let LongHeadway: String // 發車間距(高)
        public let LowHeadway: String // 發車間距(低)
        public let DateType: String // 0表示星期，1表示特殊日期
        public let DateValue: String // 星期參數值
    }
    
    public class TBStopLocation: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBStopLocationInfo]
    }
    
    public func 站位資訊(complete:@escaping (_ info: TBStopLocation?)->Void) {
        call(url: "StopLocation", complete: complete)
    }
    
    public class TBStopLocationInfo: Decodable {
        public let id: Number // 主索引
        public let name: String // 站位名稱
        public let address: String // 站址
        public let lon: String // 經度
        public let lat: String // 緯度
        public let version: Number // 系統碼
    }
    
    public class TBTimeTable: Decodable {
        public let EssentialInfo: TBEssentialInfo
        public let BusInfo: [TBTimeTableInfo]
    }
    
    public func 預定班表資訊(complete:@escaping (_ info: TBTimeTable?)->Void) {
        call(url: "TimeTable", complete: complete)
    }
    
    public class TBTimeTableInfo: Decodable {
        public let Id: Number // 主索引/查詢代碼
        public let PathAttributeId: Number // 附屬路線ID
        public let DateType: String // 日期型別:預設0:星期(WeekDay)/1:特殊日期(SpecialdDay)
        public let DateValue: String // 星期參數值:若DATE_TYPE=WeekDay，1~7:1:星期日(預設)，2:星期一，7:星期六;若DATE_TYPE=SpecialDay,yyyymmdd
        public let DepartureTime: String // 發車時間:hhmm(24小時制)
        public let IsLastBus: String // 是否為末班車(0:非末班車/1:末班車)
    }
}
