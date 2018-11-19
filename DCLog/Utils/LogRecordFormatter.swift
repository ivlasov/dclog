//
//  DCLog
//

import Foundation
import DCUtils

public protocol LogRecordFormatter {
    func execute(record: Log.Record, result: Log.RecordResult)
}

extension Log.Formatter {
    public class Object: LogRecordFormatter {
        public func execute(record: Log.Record, result: Log.RecordResult) {
            result << (record.parameters?["title"] as? String)
            if let object = record.parameters?["object"] as? LogDescription {
                result << object
            } else if let object = record.parameters?["object"] {
                result << String(describing: object)
            }
        }
    }
}

//public extension Log {

//    public static func append(tag: String? = nil, category: Log.Category = .default, priority: Int = 1000, object: Any?) {
//        Log.Instance.append(tag: tag, category: category, priority: priority, parameters: ["object" : object ?? ""])
//    }
//}
