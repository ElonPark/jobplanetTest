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
//    func sample() -> Single<>
}


struct NetworkService: NetworkServiceType {
    private let networking: Networking<JobplanetAPI>
    
    init(networking: Networking<JobplanetAPI>) {
        self.networking = networking
    }
    
//    func sample() -> Single<ViolationKindergartens> {
//        // FIXME: Test Stub
//        return Single.just(ViolationKindergartenAPI.all.sampleData)
//            .map { data in
//                return try JSONSerialization.jsonObject(
//                    with: data,
//                    options: .allowFragments
//                )
//            }
//            .map { try Mapper<ViolationKindergarten>().mapArray(JSONObject: $0) }
//
//    }
}
