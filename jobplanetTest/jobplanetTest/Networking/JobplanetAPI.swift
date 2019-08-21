//
//  JobplanetAPI.swift
//  jobplanetTest
//
//  Created by Elon on 21/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import Moya

enum JobplanetAPI {
    case sample
}

extension JobplanetAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api-test-198703.appspot.com")!
    }
    
    var path: String {
        switch self {
        case .sample:
            return "/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .sample:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .sample:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var sampleData: Data {
        switch self {
        case .sample:
            return "{}".data(using: String.Encoding.utf8)!
        }
    }
}
