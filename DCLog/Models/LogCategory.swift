//
//  DCLog
//

import Foundation

public extension Log {
    
    public struct Category: Codable {
        
        public let rawValue : String
        public let domain   : Log.Domain
        
        public init(_ rawValue: String, domain: Log.Domain = .default) {
            self.domain = domain
            self.rawValue = rawValue
        }
        
        public static func ==(lhs: Category, rhs: Category) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
        
    }
    
}

extension Log.Category: Hashable {
    public var hashValue: Int {
        return (rawValue + domain.rawValue).hashValue
    }
}

public extension Log.Category {
    static let `default` = Log.Category("default")
}
