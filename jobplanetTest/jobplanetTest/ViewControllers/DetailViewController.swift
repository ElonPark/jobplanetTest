//
//  DetailViewController.swift
//  jobplanetTest
//
//  Created by Elon on 26/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift

final class DetailViewController: UIViewController, StoryboardView {
    
    @IBOutlet weak var textView: UITextView!
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }

    func bind(reactor: DetailViewReactor) {
        Log.debug()
        reactor.state.map { (item: $0.sectionItem, themeIndex: $0.themeIndex) }
            .observeOn(MainScheduler.instance)
            .bind { [weak self] section in
                guard let `self` = self else { return }
                self.setUI(with: section.item, index: section.themeIndex)
            }
            .disposed(by: self.disposeBag)
    }
    
    private func setUI(with item: MainViewSectionItem, index: Int?) {
        switch item {
        case .company(let company):
            let model = company.initialState.model
            setCompanyModelText(by: model)
            
        case .horizontalTheme(let horizontalTheme):
            let model = horizontalTheme.initialState.model
            setHorizontalThemeModelText(by: model, index: index)
            
        case .interview(let interview):
            let model = interview.initialState.model
            setInterviewModelText(by: model)
            
        case .jobPosting(let jobPosting):
            let model = jobPosting.initialState.model
            setJobPostingModelText(by: model)
            
        case .review(let review):
            let model = review.initialState.model
            setReviewModelText(by: model)
            
        case .salary(let salary):
            let model = salary.initialState.model
            setSalaryModelText(by: model)
        }
    }
    
    private func setCompanyModelText(by model: Company) {
        textView.attributedText = """
        cellType: \(model.cellType)
        ranking: \(model.ranking)
        companyID: \(model.companyID)
        name: \(model.name)
        webSite: \(model.webSite)
        logoPath: \(model.logoPath)
        simpleDesc: \(model.simpleDesc)
        interviewDifficulty: \(model.interviewDifficulty)
        interviewQuestion: \(model.interviewQuestion)
        hasJobPosting: \(model.hasJobPosting)
        reviewSummary: \(model.reviewSummary)
        rateTotalAvg: \(model.rateTotalAvg)
        salaryAvg: \(model.salaryAvg)
        industryID: \(model.industryID)
        industryName: \(model.industryName)
        type: \(model.type)
        """.attribute(size: 17, weight: .semibold, lineSpacing: 8)
    }
    
    private func setHorizontalThemeModelText(by model: HorizontalTheme, index: Int?) {
        textView.text = """
        cellType: \(model.cellType)
        count: \(model.count)
        themes:
        
        """
        
        if let thmemIndex = index, thmemIndex < model.themes.count {
             let theme = model.themes[thmemIndex]
            textView.text.append("{\n")
            textView.text.append("  id: \(theme.id)\n")
            textView.text.append("  title: \(theme.title)\n")
            textView.text.append("  color: \(theme.color)\n")
            textView.text.append("  coverImage: \(theme.coverImage)\n")
            textView.text.append("}\n")
        }
    }
    
    private func setInterviewModelText(by model: Interview) {
        textView.attributedText = """
            cellType: \(model.cellType)
            ranking: \(model.ranking)
            companyID: \(model.companyID)
            name: \(model.name)
            logoPath: \(model.logoPath)
            simpleDesc: \(model.simpleDesc)
            interviewDifficulty: \(model.interviewDifficulty)
            interviewQuestion: \(model.interviewQuestion)
            interviewAnswer: \(model.interviewAnswer)
            interviewSummary: \(model.interviewSummary)
            interviewRangeStart: \(model.interviewRangeStart)
            rateTotalAvg: \(model.rateTotalAvg)
            industryID: \(model.industryID)
            industryName: \(model.industryName)
            type: \(model.type)
            """.attribute(size: 17, weight: .semibold, lineSpacing: 8)
    }
    
    private func setJobPostingModelText(by model: JobPosting) {
        textView.attributedText = """
        cellType: \(model.cellType)
        id: \(model.id)
        title: \(model.title)
        labelID: \(model.labelID)
        companyID: \(model.companyID)
        companyName: \(model.companyName)
        occupationIDs: \(model.occupationIDs)
        isSaved: \(model.isSaved)
        isInterview: \(model.isInterview)
        jobTypeIDs: \(model.jobTypeIDs)
        cityIDs: \(model.cityIDs)
        recruitmentTypeIDs: \(model.recruitmentTypeIDs)
        logo: \(model.logo)
        reviewAvgCache: \(model.reviewAvgCache)
        deadline: \(model.deadline)
        """.attribute(size: 17, weight: .semibold, lineSpacing: 8)
    }
    
    private func setReviewModelText(by model: Review) {
        textView.attributedText = """
        cellType: \(model.cellType)
        ranking: \(model.ranking)
        name: \(model.name)
        companyID: \(model.companyID)
        cons: \(model.cons)
        daysAgo: \(model.daysAgo)
        logoPath: \(model.logoPath)
        pros: \(model.pros)
        occupationName: \(model.occupationName)
        reviewSummary: \(model.reviewSummary)
        simpleDesc: \(model.simpleDesc)
        rateTotalAvg: \(model.rateTotalAvg)
        date: \(model.date?.description ?? "nil")
        industryID: \(model.industryID)
        industryName: \(model.industryName)
        type: \(model.type)
        """.attribute(size: 17, weight: .semibold, lineSpacing: 8)
    }
    
    private func setSalaryModelText(by model: Salary) {
        textView.attributedText = """
        cellType: \(model.cellType)
        ranking: \(model.ranking)
        companyID: \(model.companyID)
        name: \(model.name)
        logoPath: \(model.logoPath)
        hideDetail: \(model.hideDetail)
        signed_in: \(model.signed_in)
        salaryRanking: \(model.salaryRanking)
        salaryLowest: \(model.salaryLowest)
        salaryAvg: \(model.salaryAvg)
        salaryHighest: \(model.salaryHighest)
        rateTotalAvg: \(model.rateTotalAvg)
        simpleDesc: \(model.simpleDesc)
        industryID: \(model.industryID)
        industryName: \(model.industryName)
        type: \(model.type)
        """.attribute(size: 17, weight: .semibold, lineSpacing: 8)
    }
}
