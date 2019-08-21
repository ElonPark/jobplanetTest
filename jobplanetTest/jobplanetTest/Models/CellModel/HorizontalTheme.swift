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
    
    init(map: Map) throws {
        cellType = try map.value("cell_type")
    }
}
