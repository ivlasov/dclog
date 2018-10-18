//
//  DCLog
//

import Foundation

class LogDateFormatter : DateFormatter {
    
    override init() {
        super.init()
        locale = Locale(identifier: "en_US_POSIX")
        dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        timeZone = TimeZone(secondsFromGMT: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
