//
//  DCLog
//

import Foundation

extension Log {
    public struct Context {
        public let output   : Output
        public let options  : [Log.Option]
        public let include  : [Log.Category]
        public let exclude  : [Log.Category]
    }
}

extension Log.Context {
    public enum Output {
        case console
        case stream
        case streamTo(folder: URL)
    }
}

extension Log.Context {
    func canOutput(record: Log.Record) -> Bool {
        if
            include.count > 0 && include.contains(record.category),
            exclude.contains(record.category),
            let option = options.filter({$0.category == record.category}).first,
            let tag = option.tag, record.tag != tag,
            let priority = option.priority, record.priority > priority {
        }
        return true
    }
}
