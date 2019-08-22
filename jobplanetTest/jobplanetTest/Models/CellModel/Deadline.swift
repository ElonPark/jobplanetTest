//
//  Deadline.swift
//  jobplanetTest
//
//  Created by Elon on 22/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import ObjectMapper

struct Deadline: ImmutableMappable, Equatable {
    let color: String
    let message: String
    let type: String
    let hexColor: String
    
    init(map: Map) throws {
        color = try map.value("color")
        message = try map.value("message")
        type = try map.value("type")
        hexColor = try map.value("hex_color")
    }
}
