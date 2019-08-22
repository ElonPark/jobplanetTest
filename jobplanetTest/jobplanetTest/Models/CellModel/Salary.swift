//
//  Salary.swift
//  jobplanetTest
//
//  Created by Elon on 22/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import ObjectMapper

struct Salary: ImmutableMappable, CellTypeModel, Equatable {
    let cellType: CellType
    let ranking: String
    let companyID: Int
    let name: String
    let logoPath: String
    let hideDetail: Int
    let signed_in: Int
    let salaryRanking: String
    let salaryLowest: Int
    let salaryAvg: Int
    let salaryHighest: Int
    let rateTotalAvg: Double
    let simpleDesc: String
    let industryID: Int
    let industryName: String
    let type: String
    
    init(map: Map) throws {
        cellType = try map.value("cell_type")
        ranking = try map.value("ranking")
        companyID = try map.value("company_id")
        name = try map.value("name")
        logoPath = try map.value("logo_path")
        hideDetail = try map.value("hide_detail")
        signed_in = try map.value("signed_in")
        salaryRanking = try map.value("salary_ranking")
        salaryLowest = try map.value("salary_lowest")
        salaryAvg = try map.value("salary_avg")
        salaryHighest = try map.value("salary_highest")
        rateTotalAvg = try map.value("rate_total_avg")
        simpleDesc = try map.value("simple_desc")
        industryID = try map.value("industry_id")
        industryName = try map.value("industry_name")
        type = try map.value("type")
    }
}
