http://tcgwww.taipei.gov.tw/public/Attachment/77414481510.pdf

| BusData    | 定時車機資訊 |                                          |
| ---------- | ------ | ---------------------------------------- |
| 屬性         | Type   | 說明                                       |
| StationID  | Number | 該車輛所屬之場站代碼                               |
| CarType    | String | 車輛類型:0:一般、1:低底盤、2:大復康巴士、3:圓仔公車           |
| BusID      | String | 公車車牌號碼                                   |
| ProviderID | Number | 公車業者代碼                                   |
| CarID      | Number | 公車代碼                                     |
| DutyStatus | String | 勤務狀態 (0:正常、1:開始、2:結束)                    |
| BusStatus  | String | 行車狀態 (0:正常、1:車禍、2:故障、3:塞車、4:緊急求援、5:加油、99:非營運狀態) |
| RouteID    | String | 服務路線代碼(附屬路線 ID)                          |
| GoBack     | String | 去返程 (0:去程、1:回程、2:未知)                     |
| Longitude  | String | 經度 / X 座標                                |
| Latitude   | String | 緯度 / Y 座標                                |
| Speed      | String | GPS 速度(Km/Hr)                            |
| Azimuth    | String | 行車方位角                                    |
| DataTime   | String | 本筆資料觸發時間                                 |

| BusEvent   | 定點車機資訊 |                                          |
| ---------- | ------ | ---------------------------------------- |
| 屬性         | Type   | 說明                                       |
| StationID  | Number | 該車輛所屬之場站代碼                               |
| CarType    | String | 車輛類型:0:一般、1:低底盤、2:大復康巴士、3:圓仔公車           |
| BusID      | String | 公車車牌號碼                                   |
| ProviderID | Number | 公車業者代碼                                   |
| CarID      | Number | 公車代碼                                     |
| DutyStatus | String | 勤務狀態 (0:正常、1:開始、2:結束)                    |
| BusStatus  | String | 行車狀態 (0:正常、1:車禍、2:故障、3:塞車、4:緊急求援、5:加油、99:非營運狀態) |
| RouteID    | String | 服務路線代碼(附屬路線 ID)                          |
| GoBack     | String | 去返程 (0:去程、1:回程、2:未知)                     |
| StopID     | String | 公車所在位置之站牌代碼                              |

2

| BusEvent  | 定點車機資訊 |                   |
| --------- | ------ | ----------------- |
| 屬性        | Type   | 說明                |
| CarOnStop | String | 到離站狀態 (0:離站、1:進站) |
| DataTime  | String | 本筆資料觸發時間          |

3

| CarInfo         | 車輛基本資訊 |                                         |
| --------------- | ------ | --------------------------------------- |
| 屬性              | Type   | 說明                                      |
| BusId           | Number | 主索引/查詢代碼                                |
| CarNum          | String | 牌照號碼                                    |
| CarType         | String | 車輛類型:0:一般、1:低底盤、2:大復康巴士、3:圓仔公車          |
| IboxId          | Number | 車機 ID                                   |
| StationId       | Number | 所屬營業站 ID (調度站 ID)                       |
| PathAttributeId | Number | 所屬附屬路線 ID                               |
| BuildPeriod     | String | 建置時間，分為 1:1 期、2:2 期、3:3 期、9:非動態資料、10:北縣 |
| Ctime           | String | 建立時間                                    |

| CarUnusual        | 車機異常資訊                                   |
| ----------------- | ---------------------------------------- |
| 屬性                | 說明                                       |
| BusID             | Number | 車輛代碼                                     |
| StatusCode        | Number | 異常狀態代碼(0 正常、1:斷線、2:LED 顯示器斷線 3:異常停留、4:路線外營運) |
| `每筆資訊若無更新會保留二十分鐘` |                                          |

| EstimateTime | 預估到站時間 |                                          |
| ------------ | ------ | ---------------------------------------- |
| 屬性           | Type   | 說明                                       |
| RouteID      | Number | 路線代碼 (主路線 ID)                            |
| StopID       | Number | 站牌代碼                                     |
| EstimateTime | String | 預估到站剩餘時間(單位:秒)-1:尚未發車-2:交管不停靠-3:末班車已過                                    -4:今日未營運 |
| GoBack       | String | 去返程 (0:去程 1:返程 2:尚未發車 3:末班已駛離)           |

4

| IStop                   | 智慧型站牌  |                                |
| ----------------------- | ------ | ------------------------------ |
| 屬性                      | Type   | 說明                             |
| Id                      | Number | 主索引                            |
| SimCardNum              | String | SIM 卡編號                        |
| DeviceId                | Number | 智慧型站牌編號(站牌車機號碼 15 碼)           |
| StopCname               | String | 站牌中文名稱                         |
| StopEname               | String | 站牌英文名稱                         |
| QueryCode               | String | 站牌查詢代碼(4 碼)                    |
| Provider                | String | 站牌建置廠商者區分期別(1:1 期 2:2 期 3:3 期) |
| StopId                  | String | 站牌編號                           |
| Longitude               | String | 經度 (WGS84，以度為單位)               |
| Latitude                | String | 緯度 (WGS84，以度為單位)               |
| Address                 | String | 智慧型站牌地址                        |
| TypeId                  | Number | 站牌型別編號                         |
| FirmwarfeVersion        | String | 韌體版本 (向站牌車機詢問)                 |
| BootTime                | String | 預設開機時間                         |
| ShutdownTime            | String | 預設關機時間                         |
| MessageGroupId          | Number | 訊息群組編號                         |
| DefaultMessage          | String | 預設訊息                           |
| BootMessage             | String | 開機訊息                           |
| LanguageMode            | String | 多語系顯示模式0:關閉英文1:開啟英文            |
| DisplaySpeed            | String | 顯示速度 0~9                       |
| DistanceFunctionMode    | String | 站距功能開關0:關閉1:開啟                 |
| IsShowQcode             | String | 顯示站牌查詢代碼開關0:關閉1:開啟             |
| IsShowStopName          | String | 顯示站牌名稱開關0:關閉1:開啟               |
| IsShowDirectionLocation | String | `顯示方向及車輛所在位置開關`                |

5

| IStop               | 智慧型站牌  |                                         |
| ------------------- | ------ | --------------------------------------- |
| 屬性                  | Type   | 說明                                      |
|                     |        | 0:關閉1:開啟                                |
| IsShowTrafficStatus | String | 是否顯示行車狀況 (0:不顯示 / 1:顯示)                 |
| IsShowArrivingInfo  | String | 是否顯示進站中資訊 (0:不顯示 / 1:顯示)                |
| VcId                | Number | 通訊伺服器 ID                                |
| BuildPeriod         | String | 建置時間，分為 1:1 期、2:2 期、3:3 期、9:非動態資料、10:北縣 |
| Memo                | String | 備註                                      |
| Ctime               | String | 建立時間                                    |

| IStopPath | 智慧型站牌所屬路線 |         |
| --------- | --------- | ------- |
| 屬性        | Type      | 說明      |
| Id        | Number    | 主索引     |
| IStopId   | Number    | 路線設定名稱  |
| PathId    | Number    | 路線編號    |
| StopId    | Number    | 站牌編號    |
| Sequence  | Number    | 路線顯示之順序 |

| OrgPathAttribute | 路線、營業站對應 |         |
| ---------------- | -------- | ------- |
| 屬性               | Type     | 說明      |
| Id               | Number   | 主索引     |
| OrganizationId   | Number   | 營業站 ID  |
| PathAttributeId  | Number   | 附屬路線 ID |

6

| PathDetail      | 附屬路線與路線對應資訊 |                    |
| --------------- | ----------- | ------------------ |
| 屬性              | Type        | 說明                 |
| Id              | Number      | 主索引                |
| PathAttributeId | Number      | 附屬路線 ID            |
| StopId          | Number      | 站牌 ID              |
| SequenceNo      | Number      | 站序                 |
| Type            | String      | 類別:0:正常CPT:控制點)    |
| TypeAttribute   | String      | 類別屬性描述(例如控制點時間之描述) |

| Provider      | 業者營運基本資料 |                                          |
| ------------- | -------- | ---------------------------------------- |
| 屬性            | Type     | 說明                                       |
| id            | Number   | 業者代碼                                     |
| nameZn        | String   | 業者中文名稱                                   |
| nameEn        | String   | 業者英文名稱                                   |
| email         | String   | 電子信箱                                     |
| phoneInfo     | String   | 服務電話                                     |
| stationId     | Number   | 營業站(調度站)代碼                               |
| stationNameZn | String   | `營業站(調度站)中文名稱`                           |
| stationNameEn | String   | `營業站(調度站)英文名稱`                           |
| type          | String   | 營運種類 (0:市區公車、1:公路客運、2:捷運、3:火車、4 :航空客運、5:船運) |

7

| Route                   | 路線     |                                         |
| ----------------------- | ------ | --------------------------------------- |
| 屬性                      | Type   | 說明                                      |
| Id                      | Number | 路線代碼                                    |
| providerId              | Number | 業者代碼                                    |
| providerName            | String | 業者中文名稱                                  |
| nameZh                  | String | 中文名稱                                    |
| nameEn                  | String | 英文名稱                                    |
| pathAttributeId         | Number | 所屬附屬路線 ID                               |
| pathAttributeName       | String | 所屬附屬路線中文名稱                              |
| pathAttributeEname      | String | 所屬附屬路線英文名稱                              |
| buildPeriod             | String | 建置時間，分為 1:1 期、2:2 期、3:3 期、9:非動態資料、10:北縣 |
| departureZh             | String | '去程第1站' 起站中文名稱                          |
| departureEn             | String | '去程第1站' 起站英文名稱                          |
| destinationZh           | String | '回程第1站' 訖站中文名稱                          |
| destinationEn           | String | '回程第1站' 訖站英文名稱                          |
| realSequence            | String | 核定總班次                                   |
| distance                | String | 總往返里程(公里/全程)                            |
| goFirstBusTime          | String | 站牌顯示時使用，去程第一班發車時間(hhmm)                 |
| backFirstBusTime        | String | 站牌顯示時使用，回程第一班發車時間(hhmm)                 |
| goLastBusTime           | String | 站牌顯示時使用，去程最後一班發車時間(hhmm)                |
| backLastBusTime         | String | 站牌顯示時使用，回程最後一班發車時間(hhmm)                |
| peakHeadway             | String | 站牌顯示時使用，尖峰時段發車間隔(hhmm OR mm)            |
| offPeakHeadway          | String | 站牌顯示時使用，離峰時段發車間隔(hhmm OR mm)            |
| busTimeDesc             | String | 平日頭末班描述                                 |
| holidayGoFirstBusTime   | String | 假日站牌顯示時使用，去程第一班發車時間(HHmm)               |
| holidayBackFirstBusTime | String | 假日站牌顯示時使用，回程第一班發車時間(HHmm)               |
| holidayGoLastBusTime    | String | 假日站牌顯示時使用，去程最後一班發車時間(HHmm)              |
| holidayBackLastBusTime  | String | 假日站牌顯示時使用，回程最後一班發車時間(HHmm)              |
| holidayBusTimeDesc      | String | 假日頭末班描述                                 |
| headwayDesc             | String | 平日發車間距描述                                |
| holidayPeakHeadway      | String | 假日站牌顯示時使用，尖峰時段發車間隔(mmmm ORmm)           |
| holidayOffPeakHeadway   | String | 假日站牌顯示時使用，離峰時段發車間隔(mmmm ORmm)           |

8

| Route                    | 路線     |           |
| ------------------------ | ------ | --------- |
| 屬性                       | Type   | 說明        |
| holidayHeadwayDesc       | String | 假日發車間距描述  |
| segmentBufferZh          | String | 分段緩衝區(中文) |
| segmentBufferEn          | String | 分段緩衝區(英文) |
| ticketPriceDescriptionZh | String | 票價描述(中文)  |
| ticketPriceDescriptionEn | String | 票價描述(英文)  |
| aliasName                | String | 路線別名      |

| Stop           | 站牌     |                             |
| -------------- | ------ | --------------------------- |
| 屬性             | Type   | 說明                          |
| Id             | Number | 站牌代碼                        |
| routeId        | Number | 所屬路線代碼 (主路線 ID)             |
| nameZh         | String | 中文名稱                        |
| nameEn         | String | 英文名稱                        |
| seqNo          | Number | 於路線上的順序                     |
| pgp            | String | 上下車站別 (-1:可下車、0:可上下車、1:可上車) |
| goBack         | String | 去返程 (0:去程 / 1:返程 / 2:未知)    |
| longitude      | String | 經度                          |
| latitude       | String | 緯度                          |
| address        | String | 地址                          |
| stopLocationId | Number | 站位 ID                       |
| showLon        | String | 顯示用經度                       |
| showLat        | String | 顯示用緯度                       |
| vector         | String | 向量角:0~359，預設為空白             |

9

| SemiTimeTable   | 機動班次時刻表 |                 |
| --------------- | ------- | --------------- |
| 屬性              | Type    | 說明              |
| Id              | Number  | 主索引/查詢代碼        |
| PathAttributeId | Number  | 附屬路線 ID         |
| StartTime       | String  | 尖離峰時間(起)        |
| EndTime         | String  | 尖離峰時間(迄)        |
| LongHeadway     | String  | 發車間距(高)         |
| LowHeadway      | String  | 發車間距(低)         |
| DateType        | String  | 0 表示星期，1 表示特殊日期 |
| DateValue       | String  | 星期參數值           |

| StopLocation      | 站位資訊   |      |
| ----------------- | ------ | ---- |
| 屬性                | Type   | 說明   |
| id                | Number | 主索引  |
| name              | String | 站位名稱 |
| address           | String | 站址   |
| lon               | String | 經度   |
| lat               | String | 緯度   |
| version           | Number | 系統碼  |
| `每筆資訊若無更新會保留二十分鐘` |        |      |

| TimeTable       | 預定班表資訊 |                                          |
| --------------- | ------ | ---------------------------------------- |
| 屬性              | Type   | 說明                                       |
| Id              | Number | 主索引/查詢代碼                                 |
| PathAttributeId | Number | 附屬路線 ID                                  |
| DateType        | String | 日期型別:預設 0:星期(WeekDay) / 1:特殊日期(SpecialdDay) |
| DateValue       | String | 星期參數值:若 DATE_TYPE=WeekDay，1~7:1:星期日(預設)，2:星期一，7:星期六;若 DATE_TYPE=SpecialDay, yyyymmdd |
| DepartureTime   | String | 發車時間:hhmm(24 小時制)                        |
| IsLastBus       | String | 是否為末班車(0:非末班車 / 1:末班車)                   |
