//
//  DCLog
//

import Foundation
import DCUtils

public protocol LogDescription {
    func logDescription() -> String
}

public extension Log {
    public class RecordResult {
        
        fileprivate var values = [String]()
        
        public func execute() -> String? {
            return values.count > 0 ? values.joinedBy(separator: "\n") : nil
        }
        
        public func append(_ value: String) {
            values.append(value)
        }
        
        public func append(_ value: LogDescription) {
            values.append(value.logDescription())
        }
        
        public static func << (lhs: Log.RecordResult, rhs: String?) {
            guard let rhs = rhs else { return }
            lhs.append(rhs)
        }
        
        public static func << (lhs: Log.RecordResult, rhs: LogDescription?) {
            guard let rhs = rhs else { return }
            lhs.append(rhs)
        }
        
    }
}
