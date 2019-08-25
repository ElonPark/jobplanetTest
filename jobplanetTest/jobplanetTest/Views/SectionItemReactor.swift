//
//  SectionItemReactor.swift
//  jobplanetTest
//
//  Created by Elon on 25/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import ReactorKit
import RxSwift

final class SectionItemReactor<T: Equatable>: Reactor, Equatable {
    
    typealias Action = NoAction
    
    struct State {
        var model: T
    }
    
    let initialState: State
    
    init(model: T) {
        defer { _ = self.state } // state 스트림 생성
        self.initialState = State(model: model)
    }
    
    static func == (lhs: SectionItemReactor<T>, rhs: SectionItemReactor<T>) -> Bool {
        return lhs.initialState.model == rhs.initialState.model
    }
}
