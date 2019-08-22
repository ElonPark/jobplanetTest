//
//  Theme.swift
//  jobplanetTest
//
//  Created by elon on 22/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import ObjectMapper

struct Theme: ImmutableMappable, Equatable {
    let id: Int
    let title: String
    let color: String
    let coverImage: String
    
    init(map: Map) throws {
        id = try map.value("id")
        title = try map.value("title")
        color = try map.value("color")
        coverImage = try map.value("cover_image")
    }
}
