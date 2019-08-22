//
//  NetworkService.swift
//  jobplanetTest
//
//  Created by Elon on 21/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import RxSwift
import Moya
import ObjectMapper
import Moya_ObjectMapper


protocol NetworkServiceType {
    func sample() -> Single<Jobplanet>
}

struct NetworkService: NetworkServiceType {
    private let networking: Networking<JobplanetAPI>
    
    init(networking: Networking<JobplanetAPI>) {
        self.networking = networking
    }
    
    func sample() -> Single<Jobplanet> {
        return networking.request(.sample)
            .mapObject(Jobplanet.self)
            .do(onError: { error in
                Log.error(error)
            })
    }
}
