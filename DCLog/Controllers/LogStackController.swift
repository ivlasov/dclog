//
//  DCLog
//

import Foundation

class LogStackController {
    
    private(set) var items = [Log.Record]()
    
    init() {}
    
    func add(record: Log.Record) {
        items.append(record)
        checkAndFlush()
    }
    
    func remove(record: Log.Record) {
        items.removeAll(where: {$0 == record})
    }
    
    fileprivate func checkAndFlush() {
        guard items.count == 100 else {return}
        flush()
    }
    
    func flush() {
        
    }
    
}
