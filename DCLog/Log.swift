//
//  DCLog
//

import Foundation
import DCUtils

public enum Log {
    public enum Output {}
    public enum Formatter {}
}

extension Logs {
    public static let `default` = Log.Controller()
}

protocol LogOutput {
    func append(record: Log.Record, context: Log.Context)
    func flush(context: Log.Context)
}

public class LogWeak: NSObject {
    @objc public func append(_ info: [String:Any]?) {
        if let info = info, let record = Log.Record(weak: info) {
            Logs.default.append(record: record)
        }
    }
}
