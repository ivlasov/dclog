//
//  DCLog
//

import Foundation

extension Log {
    public class Controller {
        
        fileprivate let stack = LogStackController()
        fileprivate var contexts = [Context]()
        fileprivate var formatters = [Category:LogRecordFormatter]()
        
        fileprivate let console = Output.Console()
        
        init() {}
        
        func setup(contexts: [Context], formatters: [Category:LogRecordFormatter]) {
            flush()
            self.contexts = contexts
            self.formatters = formatters
        }
        
        func append(record: Record) {
            var record = record
            let result = RecordResult()
            Log.Formatter.Object().execute(record: record, result: result)
            if let result = result.execute() {
                record = Record(record: record, result: result)
            }
            for context in contexts {
                switch context.output {
                case .console   : console.append(record: record, context: context)
                default         : break
                }
            }
        }
        
        func flush() {
            for context in contexts {
                switch context.output {
                case .console   : console.flush(context: context)
                default         : break
                }
            }
        }
    }
}
