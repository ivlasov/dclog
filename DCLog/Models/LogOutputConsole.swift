//
//  DCLog
//

import Foundation

extension Log.Output {
    class Console: LogOutput {
        
        func append(record: Log.Record, context: Log.Context) {
            guard context.canOutput(record: record) else { return }
            print("[\(record.priority):\(record.tag ?? "Default"):\(record.category.rawValue)] \(record.result ?? "")")
        }
        
        func flush(context: Log.Context) {}
        
    }
}
