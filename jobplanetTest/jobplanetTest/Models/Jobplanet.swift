//
//  Jobplanet.swift
//  jobplanetTest
//
//  Created by Elon on 21/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import ObjectMapper

struct Jobplanet: ImmutableMappable {
    
    let minimumInterviews: Int
    let minimumReviews: Int
    let minimumSalaries: Int
    
    let items: [CellTypeModel]
    
    let page: Int
    let pageSize: Int
    let totalPage: Int
    let totalCount: Int
    
    
    init(map: Map) throws {
        minimumInterviews = try map.value("minimum_interviews")
        minimumReviews = try map.value("minimum_reviews")
        minimumSalaries = try map.value("minimum_salaries")
        
        items = try map.value("items")
        
        page = try map.value("page")
        pageSize = try map.value("page_size")
        totalPage = try map.value("total_page")
        totalCount = try map.value("total_count")
    }
}
