//
//  DCLog
//

import Foundation

class LogStackController {
    
    private(set) var items = [Log.Record]()
    
    init() {}
    
    func append(record: Log.Record) {
        items.append(record)
        checkAndFlush()
    }
    
    fileprivate func checkAndFlush() {
        guard items.count == 100 else {return}
        flush()
    }
    
    func flush() {}
    
}
