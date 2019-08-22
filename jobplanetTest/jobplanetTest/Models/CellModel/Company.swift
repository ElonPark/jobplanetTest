//
//  Company.swift
//  jobplanetTest
//
//  Created by Elon on 22/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import ObjectMapper

struct Company: ImmutableMappable, CellTypeModel, Equatable {
    let cellType: CellType
    let ranking: Int
    let companyID: Int
    let name: String
    let webSite: String
    let logoPath: String
    let simpleDesc: String
    let interviewDifficulty: Double
    let interviewQuestion: String
    let hasJobPosting: String
    let reviewSummary: String
    let rateTotalAvg: Double
    let salaryAvg: Int
    let industryID: Int
    let industryName: String
    let type: String
    
    init(map: Map) throws {
        cellType = try map.value("cell_type")
        ranking = try map.value("ranking")
        companyID = try map.value("company_id")
        name = try map.value("name")
        webSite = try map.value("web_site")
        logoPath = try map.value("logo_path")
        simpleDesc = try map.value("simple_desc")
        interviewDifficulty = try map.value("interview_difficulty")
        interviewQuestion = try map.value("interview_question")
        hasJobPosting = try map.value("has_job_posting")
        reviewSummary = try map.value("review_summary")
        rateTotalAvg = try map.value("rate_total_avg")
        salaryAvg = try map.value("salary_avg")
        industryID = try map.value("industry_id")
        industryName = try map.value("industry_name")
        type = try map.value("type")
    }
}
