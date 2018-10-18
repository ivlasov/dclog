//
//  DCLog
//

import Foundation

public protocol LogRecordFormatter {
    func execute(record: Log.Record, result: Log.RecordResult)
}

public extension Log {
    public class TextFormatter: LogRecordFormatter {
        public func execute(record: Log.Record, result: Log.RecordResult) {
            result << (record.parameters?["text"] as? String)
            if let object = record.parameters?["object"] as? LogDescription {
                result << object
            } else if let object = record.parameters?["object"] {
                result << String(describing: object)
            }
        }
    }
}
