//
//  DCLog
//

import DCUtils
import Foundation

public extension Log {
    public struct Domain: Codable {
        
        public let rawValue: String
        
        public init(_ rawValue: String) {
            self.rawValue = rawValue
        }
        
        public static func ==(lhs: Domain, rhs: Domain) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
        
    }
}

public extension Log.Domain {
    public static let `default` = Log.Domain((Bundle.main.infoDictionaryKeys?[.identifier] as? String) ?? "")
}
