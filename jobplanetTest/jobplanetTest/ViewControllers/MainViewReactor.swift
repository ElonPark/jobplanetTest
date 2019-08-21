//
//  MainViewReactor.swift
//  jobplanetTest
//
//  Created by Elon on 21/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class MainViewReactor: Reactor {
    
    enum Action {
        case loadData
    }
    
    enum Mutation {
        case setLoading(Bool)
    }
    
    struct State {
        var isLoading: Bool = false
    }
    
    let networkService: NetworkService
    let initialState: State = State()
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        
        _ = self.state
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
         switch action {
         case .loadData:
            let startLoading: Observable<Mutation> = .just(.setLoading(true))
            let endLoading: Observable<Mutation> = .just(.setLoading(false))
            
            return .concat([startLoading, endLoading])
         }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .setLoading(let isLoading):
            newState.isLoading = isLoading
            return newState
        }
    }
    
}
