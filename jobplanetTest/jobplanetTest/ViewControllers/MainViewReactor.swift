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
        case itemSelected(IndexPath)
        case themeSelected((item: IndexPath, theme: IndexPath))
    }
    
    enum Mutation {
        case setLoading(Bool)
        case setJobplanet([MainViewSectionItem])
        case setSelectedItem(Int)
        case setSelectedTheme(IndexPath)
    }
    
    struct State {
        var isLoading: Bool = false
        var sections = [MainViewSection]()
        var selectedItem: MainViewSectionItem? = nil
        var selectedTheme: (item: MainViewSectionItem?, themeIndex: IndexPath)? = nil
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
                .map(mainViewSectionItems)
                .map(Mutation.setJobplanet)
            
            return .concat([startLoading, setJobplanet, endLoading])
            
        case .itemSelected(let indexPath):
            Log.debug(indexPath.row)
            return .just(.setSelectedItem(indexPath.row))
            
        case .themeSelected(let indexPaths):
            let indexPath = IndexPath(item: indexPaths.theme.item, section: indexPaths.item.row)
            return .just(.setSelectedTheme(indexPath))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .setLoading(let isLoading):
            newState.selectedItem = nil
            newState.selectedTheme = nil
            newState.isLoading = isLoading
            return newState
            
        case .setJobplanet(let sectionItems):
            newState.selectedItem = nil
            newState.selectedTheme = nil
            newState.sections = [.jobplanet(sectionItems)]
            return newState
            
        case .setSelectedItem(let row):
            newState.selectedTheme = nil
            newState.selectedItem = newState.sections.first?.items[row]
            return newState
            
        case .setSelectedTheme(let indexPath):
            newState.selectedItem = nil
            let section = newState.sections.first?.items[indexPath.section]
            newState.selectedTheme = (section, indexPath)
            return newState
        }
    }
    
    private func mainViewSectionItems(with jobplanet: Jobplanet) -> [MainViewSectionItem] {
        return jobplanet.items.compactMap { item -> MainViewSectionItem? in
            switch item.cellType {
            case .company:
                guard let company = item.data as? Company else { return nil }
                let reactor = SectionItemReactor(model: company)
                return .company(reactor)
                
            case .horizontalTheme:
                guard let horizontalTheme = item.data as? HorizontalTheme else { return nil }
                let reactor = SectionItemReactor(model: horizontalTheme)
                return .horizontalTheme(reactor)
                
            case .interview:
                guard let interview = item.data as? Interview else { return nil }
                let reactor = SectionItemReactor(model: interview)
                return .interview(reactor)
                
            case .jobPosting:
                guard let jobPosting = item.data as? JobPosting else { return nil }
                let reactor = SectionItemReactor(model: jobPosting)
                return .jobPosting(reactor)
                
            case .review:
                guard let review = item.data as? Review else { return nil }
                let reactor = SectionItemReactor(model: review)
                return .review(reactor)
                
            case .salary:
                guard let salary = item.data as? Salary else { return nil }
                let reactor = SectionItemReactor(model: salary)
                return .salary(reactor)
            }
        }
    }
}
