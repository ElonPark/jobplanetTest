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
//
//extension CellItem {
//    static func == (lhs: CellItem, rhs: CellItem) -> Bool {
//        guard lhs.cellType == rhs.cellType else { return false }
//        switch lhs.cellType {
//        case .company:
//            return (lhs.data as! Company) == (rhs.data as! Company)
//
//        case .horizontalTheme:
//            return (lhs.data as! HorizontalTheme) == (rhs.data as! HorizontalTheme)
//
//        case .interview:
//            return (lhs.data as! Interview) == (rhs.data as! Interview)
//
//        case .jobPosting:
//            return (lhs.data as! JobPosting) == (rhs.data as! JobPosting)
//
//        case .review:
//            return (lhs.data as! Review) == (rhs.data as! Review)
//
//        case .salary:
//            return (lhs.data as! Salary) == (rhs.data as! Salary)
//
//        }
//    }
//
//}
