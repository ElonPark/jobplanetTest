//
//  Interview.swift
//  jobplanetTest
//
//  Created by Elon on 22/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import ObjectMapper

struct Interview: ImmutableMappable, CellTypeModel, Equatable {
    let cellType: CellType
    let ranking: Int
    let companyID: Int
    let name: String
    let logoPath: String
    let simpleDesc: String
    let interviewDifficulty: Double
    let interviewQuestion: String
    let interviewAnswer: String
    let interviewSummary: String
    let interviewRangeStart: Double
    let rateTotalAvg: Double
    let industryID: Int
    let industryName: String
    let type: String
    
    
    init(map: Map) throws {
        cellType = try map.value("cell_type")
        ranking = try map.value("ranking")
        companyID = try map.value("company_id")
        name = try map.value("name")
        logoPath = try map.value("logo_path")
        simpleDesc = try map.value("simple_desc")
        interviewDifficulty = try map.value("interview_difficulty")
        interviewQuestion = try map.value("interview_question")
        interviewAnswer = try map.value("interview_answer")
        interviewSummary = try map.value("interview_summary")
        interviewRangeStart = try map.value("interview_range_start")
        rateTotalAvg = try map.value("rate_total_avg")
        industryID = try map.value("industry_id")
        industryName = try map.value("industry_name")
        type = try map.value("type")
    }
}
