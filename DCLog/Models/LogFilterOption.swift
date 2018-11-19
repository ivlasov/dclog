//
//  DCLog
//

import Foundation

extension Log {
    public struct Option {
        public let category : Log.Category
        public let priority : Int?
        public let tag      : String?
    }
}
