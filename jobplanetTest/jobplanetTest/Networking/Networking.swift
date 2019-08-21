//
//  Networking.swift
//  jobplanetTest
//
//  Created by Elon on 21/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import Moya
import RxSwift

final class Networking<Target: TargetType>: MoyaProvider<Target> {
    
    init(plugins: [PluginType] = []) {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 30
        
        let manager = Manager(configuration: configuration)
        manager.startRequestsImmediately = false
        
        super.init(manager: manager, plugins: plugins)
    }
    
    func request(_ target: Target, file: String = #file, function: String = #function, line: UInt = #line) -> Single<Response> {
        let requestString = "\(target.method) \(target.path)"
        
        return self.rx.request(target)
            .filterSuccessfulStatusCodes()
            .do(onSuccess: { value in
                let message = "SUCCESS: \(requestString) (\(value.statusCode))"
                Log.debug(fileName: file, line: line, funcName: function, message)
                
            }, onError: { error in
                if let response = (error as? MoyaError)?.response {
                    if let jsonObject = try? response.mapJSON(failsOnEmptyData: false) {
                        let message = "FAILURE: \(requestString) (\(response.statusCode))\n\(jsonObject)"
                        Log.warning(fileName: file, line: line, funcName: function, message)
                        
                    } else {
                        let message = "FAILURE: \(requestString) (\(response.statusCode))"
                        let rawString = String(data: response.data, encoding: .utf8) ?? ""
                        Log.warning(fileName: file, line: line, funcName: function, message, rawString)
                    }
                } else {
                    let message = "FAILURE: \(requestString)"
                    Log.warning(fileName: file, line: line, funcName: function,
                                message, error.localizedDescription, error)
                }
                
            }, onSubscribed: {
                let message = "REQUEST: \(requestString)"
                Log.debug(fileName: file, line: line, funcName: function, message)
            })
    }
}

