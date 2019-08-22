//
//  CellItem.swift
//  jobplanetTest
//
//  Created by Elon on 22/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import ObjectMapper

struct CellItem: ImmutableMappable {
    
    let cellType: CellType
    let data: CellTypeModel
    
    init(map: Map) throws {
        cellType = try map.value("cell_type")

        switch cellType {
        case .company:
            data = try Company(map: map)

        case .horizontalTheme:
            data = try HorizontalTheme(map: map)

        case .interview:
            data = try Interview(map: map)

        case .jobPosting:
            data = try JobPosting(map: map)

        case .review:
            data = try Review(map: map)

        case .salary:
            data = try Salary(map: map)
        }
    }
}
