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
        case setJobplanet(Jobplanet)
    }
    
    struct State {
        var isLoading: Bool = false
        var jobplanet: Jobplanet? = nil
    }
    
    let networkService: NetworkService
    let initialState: State
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .loadData:
            let startLoading: Observable<Mutation> = .just(.setLoading(true))
            let endLoading: Observable<Mutation> = .just(.setLoading(false))
            
            let setJobplanet = networkService.sample()
                .asObservable()
                .map(Mutation.setJobplanet)
            
            return .concat([startLoading, setJobplanet, endLoading])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .setLoading(let isLoading):
            newState.isLoading = isLoading
            return newState
            
        case .setJobplanet(let model):
            newState.jobplanet = model
            return newState
        }
    }
    
}
