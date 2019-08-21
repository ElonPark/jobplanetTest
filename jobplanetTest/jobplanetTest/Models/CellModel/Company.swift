//
//  Company.swift
//  jobplanetTest
//
//  Created by Elon on 22/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import ObjectMapper

struct Company: ImmutableMappable, CellTypeModel {
    let cellType: CellType
    let name: String
    
    init(map: Map) throws {
        cellType = try map.value("cell_type")
        name = try map.value("name")
    }
}
