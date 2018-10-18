//
//  DCLog
//

import DCUtils
import Foundation

class LogFileController {
    
    let url     : URL
    let records : [Log.Record]
    let version = "1.0"
    
    init(url: URL, records: [Log.Record] = []) {
        if url.lastPathComponent.length == 0 {
            self.url = URL(string: url.absoluteString + "/Log - \(LogDateFormatter().string(from: Date())).json")!
        } else {
            self.url = url
        }
        self.records = records
    }
    
    fileprivate struct File: Codable {
        let version: String
        let records: [Log.Record]
    }
    
    func save() throws {
        do {
            let coder = JSONEncoder()
            coder.dateEncodingStrategy = .formatted(LogDateFormatter())
            let data = try coder.encode(File(version: version, records: records))
            try data.write(to: url)
        } catch {
            throw NSError(localizedKey: "Failed to save log file to \(url.absoluteString)")!
        }
    }
    
}
