//
//  JobPosting.swift
//  jobplanetTest
//
//  Created by Elon on 22/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import ObjectMapper

struct JobPosting: ImmutableMappable, CellTypeModel, Equatable {
    let cellType: CellType
    let id: Int
    let title: String
    let labelID: String
    let companyID: Int
    let companyName: String
    let occupationIDs: [Int]
    let isSaved: String
    let isInterview: String
    let jobTypeIDs: [Int]
    let cityIDs: [Int]
    let recruitmentTypeIDs: [Int]
    let logo: String
    let reviewAvgCache: Double
    let deadline: Deadline
    
    init(map: Map) throws {
        cellType = try map.value("cell_type")
        id = try map.value("id")
        title = try map.value("title")
        labelID = try map.value("label_id")
        companyID = try map.value("company_id")
        companyName = try map.value("company_name")
        occupationIDs = try map.value("occupation_ids")
        isSaved = try map.value("is_saved")
        isInterview = try map.value("is_interview")
        jobTypeIDs = try map.value("job_type_ids")
        cityIDs = try map.value("city_ids")
        recruitmentTypeIDs = try map.value("recruitment_type_ids")
        logo = try map.value("logo")
        reviewAvgCache = try map.value("review_avg_cache")
        deadline = try map.value("deadline")
    }
}
