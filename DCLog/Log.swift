//
//  DCLog
//

import Foundation

public class Log {
    
    static let shared = Log()
    
    public static func current() -> Log {
        return shared
    }
    
    fileprivate let stack = LogStackController()
    fileprivate var contexts = [Context]()
    fileprivate var formatters = [Category:LogRecordFormatter]()
    
    fileprivate init() {}
    
    public func setup(contexts: [Context], formatters: [Category:LogRecordFormatter] = [:]) {
        flush()
        self.contexts = contexts
        self.formatters = formatters
    }
    
    public func execute(tag: String? = nil,category: Category = .default, priority: Int = 1000, parameters: [String:Any]? = nil) {
        execute(record: Record(tag: tag, category: category, priority: priority, parameters: parameters))
    }
    
    fileprivate func execute(record: Record) {
        var record = record
        let result = RecordResult()
        TextFormatter().execute(record: record, result: result)
        if let result = result.execute() {
            record = Record(record: record, result: result)
        }
        for context in contexts {
            execute(context: context, record: record)
        }
    }
    
    fileprivate func execute(context: Context, record: Record) {
        switch context.output {
        case .console   : print("[\(record.category.rawValue)] \(record.result ?? "")")
        default         : break
        }
    }
    
    public func flush() {
    }
    
}
