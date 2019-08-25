//
//  DetailViewReactor.swift
//  jobplanetTest
//
//  Created by Elon on 26/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class DetailViewReactor: Reactor {
    
    typealias Action = NoAction
    
    struct State {
        var sectionItem: MainViewSectionItem
    }
    
    let initialState: State
    
    init(item: MainViewSectionItem) {
        initialState = State(sectionItem: item)
    }
}
