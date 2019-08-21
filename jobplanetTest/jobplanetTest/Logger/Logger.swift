//
//  Logger.swift
//  jobplanetTest
//
//  Created by elon on 21/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import Foundation

/// Extensions to the DispatchQueue class
fileprivate extension DispatchQueue {
    
    /// Extract the current dispatch queue's label name (Temp workaround until this is added to Swift 3.0 properly)
    static var currentQueueLabel: String? {
        return String(validatingUTF8: __dispatch_queue_get_label(nil))
    }
}

/// Custom Loggger
///
/// [gist](https://gist.github.com/ElonPark/5af00b793389c05545593a42f37b7c72)
struct Log {
    
    enum Level: String {
        case verbose = "📢 [VERBOSE]"
        case debug = "🛠 [DEBUG]"
        case info = "💡 [INFO]"
        case warning = "⚠️ [WARNING]"
        case error = "🚨 [ERROR]"
        
        func value() -> Int {
            let intValue: [Log.Level : Int] = [
                .verbose : 0,
                .debug : 1,
                .info : 2,
                .warning : 3,
                .error : 4
            ]
            
            return intValue[self] ?? 4
        }
    }
    
    private static var time: String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR") // 로케일 설정
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS" // 날짜 형식 설정
        let dateNow = dateFormatter.string(from: now)
        
        return dateNow
    }
    
    private static var threadName: String {
        if let threadName = Thread.current.name, !threadName.isEmpty {
            return threadName
        } else if let queueName = DispatchQueue.currentQueueLabel, !queueName.isEmpty {
            return queueName
        } else {
            return String(format: "%p", Thread.current)
        }
    }
    
    private static var configLevel: Log.Level = .verbose
    
    private static let internalQueue = DispatchQueue(label: "internalPrintQueue")
    
    private init() {}
    
    static func setLevel( _ config: Log.Level) {
        configLevel = config
    }
    
    private static func logger(_ level: Log.Level, fileName: String, line: UInt, funcName: String, output: Any) {
        #if DEBUG
        guard  configLevel.value() <= level.value() else { return }
        guard let file = fileName.components(separatedBy: "/").last else { return }
        
        let thread = threadName
        
        internalQueue.sync {
            if let items = output as? [Any] {
                switch items.count {
                case 0:
                    Swift.print("\(time): \(level.rawValue) \(file):\(line) (\(funcName)) [\(thread)]")
                case 1:
                    Swift.print("\(time): \(level.rawValue) \(file):\(line) (\(funcName)) [\(thread)] -> \(items[0])")
                default:
                    var logString = "\(time): \(level.rawValue) \(file):\(line) (\(funcName)) [\(thread)] -> \n"
                    logString += items.map { "\($0)\n" }
                        .reduce("", +)
                    
                    Swift.print(logString)
                }
            } else {
                Swift.print("\(time): \(level.rawValue) \(file):\(line) (\(funcName)) [\(thread)] -> \(output)")
            }
        }
        #endif
    }
    
    static func verbose(fileName: String = #file, line: UInt = #line, funcName: String = #function, _ output: Any...) {
        logger(.verbose, fileName: fileName, line: line, funcName: funcName, output: output)
    }
    
    static func debug(fileName: String = #file, line: UInt = #line, funcName: String = #function, _ output: Any...) {
        logger(.debug, fileName: fileName, line: line, funcName: funcName, output: output)
    }
    
    static func info(fileName: String = #file, line: UInt = #line, funcName: String = #function, _ output: Any...) {
        logger(.info, fileName: fileName, line: line, funcName: funcName, output: output)
    }
    
    static func warning(fileName: String = #file, line: UInt = #line, funcName: String = #function, _ output: Any...) {
        logger(.warning, fileName: fileName, line: line, funcName: funcName, output: output)
    }
    
    static func error(fileName: String = #file, line: UInt = #line, funcName: String = #function, _ output: Any...) {
        logger(.error, fileName: fileName, line: line, funcName: funcName, output: output)
    }
}
