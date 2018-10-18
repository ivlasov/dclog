//
//  DCLog
//

import Foundation

public extension Log {
    public struct Context {
        
        public enum Output {
            case console
            case stream
            case streamTo(folder: URL)
        }
        
        public let output   : Output
        public let options  : [Log.FilterOption]
        public let include  : [Log.Category]
        public let exclude  : [Log.Category]
        
        public init(output: Output, options: [Log.FilterOption] = [], include: [Log.Category] = [], exclude: [Log.Category] = []) {
            self.output = output
            self.options = options
            self.include = include
            self.exclude = exclude
        }
        
    }
}
