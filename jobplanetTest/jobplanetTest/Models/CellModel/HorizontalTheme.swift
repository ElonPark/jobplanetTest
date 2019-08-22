//
//  HorizontalTheme.swift
//  jobplanetTest
//
//  Created by Elon on 22/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import ObjectMapper

struct HorizontalTheme: ImmutableMappable, CellTypeModel {
    let cellType: CellType
    let count: Int
    let themes: [Theme]
    
    init(map: Map) throws {
        cellType = try map.value("cell_type")
        count = try map.value("count")
        themes = try map.value("themes")
    }
}

