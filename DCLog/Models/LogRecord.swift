//
//  DCLog
//

import Foundation

fileprivate func LogRecordParametersBase64(info: [String:Any]?) -> String? {
    guard
        let parameters = info,
        let result = (try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted))?.base64EncodedString(),
        result.length > 0
    else { return nil }
    return result
}

fileprivate func LogRecordParametersObject(base64: String) -> [String:Any]? {
    guard
        let aData = base64.data(using: .utf8),
        let data = Data(base64Encoded: aData),
        let info = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
    else { return nil }
    return info as? [String:Any]
}

public extension Log {
    public struct Record {
        
        public let uuid         : String
        public let created      : Date
        public let tag          : String?
        public let category     : Log.Category
        public let priority     : Int
        public let parameters   : [String:Any]?
        public let result       : String?
        
        init(tag: String?, category: Log.Category, priority: Int, parameters: [String:Any]?) {
            self.uuid       = UUID().uuidString
            self.created    = Date()
            self.tag        = tag
            self.category   = category
            self.priority   = priority
            self.parameters = parameters
            self.result     = nil
        }
        
        init(record: Record, result: String) {
            uuid        = record.uuid
            created     = record.created
            tag         = record.tag
            category    = record.category
            priority    = record.priority
            parameters  = record.parameters
            self.result = result
        }
        
        public static func ==(lhs: Record, rhs: Record) -> Bool {
            return lhs.uuid == rhs.uuid
        }
        
        enum CodingKeys: String, CodingKey {
            case uuid
            case created
            case tag
            case category
            case priority
            case parameters
            case result
        }
        
    }
}

extension Log.Record: Decodable {
    public init(from decoder: Decoder) throws {
        let values  = try decoder.container(keyedBy: CodingKeys.self)
        uuid        = try values.decode(String.self, forKey: .uuid)
        created     = try values.decode(Date.self, forKey: .uuid)
        tag         = try values.decode(String.self, forKey: .uuid)
        category    = try values.decode(Log.Category.self, forKey: .uuid)
        priority    = try values.decode(Int.self, forKey: .uuid)
        result      = try values.decode(String.self, forKey: .uuid)
        parameters  = LogRecordParametersObject(base64: try values.decode(String.self, forKey: .parameters))
    }
}

extension Log.Record: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(created, forKey: .uuid)
        try container.encode(tag, forKey: .uuid)
        try container.encode(category, forKey: .uuid)
        try container.encode(priority, forKey: .uuid)
        try container.encode(result, forKey: .uuid)
        try container.encode(LogRecordParametersBase64(info: parameters), forKey: .uuid)
    }
}
