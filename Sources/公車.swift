import Foundation

public class TBLocation: Decodable {
    public let name: String
    public let CenterName: String
}

public class TBEssentialInfo: Decodable {
    public let Location: TBLocation
    public let UpdateTime: String
    public let CoordinateSystem: String
}

public class TBBusInfo: Decodable {
    public let RouteID: Int
    public let StopID: Int
    public let EstimateTime: String
    public let GoBack: String
}

public class TBEstimateTime: Decodable {
    public let EssentialInfo: TBEssentialInfo
    public let BusInfo: [TBBusInfo]
}


