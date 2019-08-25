//
//  Review.swift
//  jobplanetTest
//
//  Created by Elon on 22/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import ObjectMapper

struct Review: ImmutableMappable, CellTypeModel, Equatable {
    let cellType: CellType
    let ranking: Int
    let name: String
    let companyID: Int
    let cons: String
    let daysAgo: Int
    let logoPath: String
    let pros: String
    let occupationName: String
    let reviewSummary: String
    let simpleDesc: String
    let rateTotalAvg: Double
    let date: Date?
    let industryID: Int
    let industryName: String
    let type: String
    
    private let yyyyMMdd = DateFormatter().then {
        $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        $0.calendar = Calendar(identifier: .iso8601)
        $0.timeZone = TimeZone(secondsFromGMT: 0)
        $0.locale = Locale(identifier: "ko_kr")
    }
    
    init(map: Map) throws {
        cellType = try map.value("cell_type")
        ranking = try map.value("ranking")
        name = try map.value("name")
        companyID = try map.value("company_id")
        cons = try map.value("cons")
        daysAgo = try map.value("days_ago")
        logoPath = try map.value("logo_path")
        pros = try map.value("pros")
        occupationName = try map.value("occupation_name")
        reviewSummary = try map.value("review_summary")
        simpleDesc = try map.value("simple_desc")
        rateTotalAvg = try map.value("rate_total_avg")
        
        let transform = DateFormatterTransform(dateFormatter: yyyyMMdd)
        date = try? map.value("date", using: transform)
        industryID = try map.value("industry_id")
        industryName = try map.value("industry_name")
        type = try map.value("type")
    }
}
