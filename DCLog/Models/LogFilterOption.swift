//
//  DCLog
//

import Foundation

public extension Log {
    public struct FilterOption {
        let category: Log.Category
        let level   : Int?
        let tag     : String?
    }
}
