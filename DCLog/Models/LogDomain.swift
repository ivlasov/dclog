//
//  DCLog
//

import DCUtils
import Foundation

extension Log {
    public struct Domain: Codable {
        public let rawValue: String
    }
}

extension Log.Domain {
    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Log.Domain {
    public static func ==(lhs: Log.Domain, rhs: Log.Domain) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension Log.Domain {
    public static let `default` = Log.Domain((Bundle.main.infoDictionaryKeys[.identifier] as? String) ?? "")
}
