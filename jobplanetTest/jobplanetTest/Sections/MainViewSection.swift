//
//  CompanySection.swift
//  jobplanetTest
//
//  Created by Elon on 24/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import RxDataSources

enum MainViewSection: Equatable {
    case jobplanet([MainViewSectionItem])
}

extension MainViewSection: SectionModelType {

    var items: [MainViewSectionItem] {
        switch self {
        case .jobplanet(let items):
            return items
        }
    }
    
    init(original: MainViewSection, items: [MainViewSectionItem]) {
        switch original {
        case .jobplanet:
            self = .jobplanet(items)
        }
    }
}

enum MainViewSectionItem: Equatable {
    case company(SectionItemReactor<Company>)
    case horizontalTheme(SectionItemReactor<HorizontalTheme>)
    case interview(SectionItemReactor<Interview>)
    case jobPosting(SectionItemReactor<JobPosting>)
    case review(SectionItemReactor<Review>)
    case salary(SectionItemReactor<Salary>)
}
