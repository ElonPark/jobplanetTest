//
//  CompanyCell.swift
//  jobplanetTest
//
//  Created by Elon on 24/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift

final class CompanyCell: UITableViewCell, NibLoadableView, ReactorKit.View, HasShowMoreButton {
    
    // MARK: UI
    
    @IBOutlet weak var titleView: CompanyInfoTitleView!
    
    @IBOutlet weak var titleLinewView: UIView!
    
    @IBOutlet weak var reviewSummaryView: UIView!
    @IBOutlet weak var reviewSummaryLabel: UILabel!
    
    @IBOutlet weak var salaryView: UIView!
    @IBOutlet weak var salaryAvgTitleLabel: UILabel!
    @IBOutlet weak var salaryAvgLabel: UILabel!
    @IBOutlet weak var salaryAvgUnitLabel: UILabel!
    
    @IBOutlet weak var interviewQuestionView: UIView!
    @IBOutlet weak var interviewQuestionTitleLabel: UILabel!
    @IBOutlet weak var interviewQuestionLabel: UILabel!
    @IBOutlet weak var interviewQuestionLineView: UIView!
    
    @IBOutlet weak var showMoreButton: UIButton!
    
    
    // MARK: Properties
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    // MARK: Binding
    
    func bind(reactor: SectionItemReactor<Company>) {
        reactor.state.map { $0.model }
            .distinctUntilChanged()
            .observeOn(MainScheduler.instance)
            .bind { [weak self] company in
                guard let self = self else { return }
                self.titleView.setLogoImage(by: company.logoPath)
                self.titleView.titleLabel.text = company.name
                self.titleView.rateLabel.text = String(company.rateTotalAvg)
                self.titleView.industryNameLabel.text = company.industryName
                self.salaryAvgLabel.text = company.salaryAvg.withComma()
                self.setReviewSummaryLabel(by: company.reviewSummary)
                self.setInterviewQuestionLabel(by: company.interviewQuestion)
            }
            .disposed(by: self.disposeBag)
    }
    
    
    // MARK: internal
    
    private func initUI() {
        reviewSummaryLabel.text = ""
        salaryAvgLabel.text = "0"
        interviewQuestionLabel.text = ""
    }
  
    private func setReviewSummaryLabel(by review: String) {
        let text = review.isEmpty ? "" : #""\#(review)""#
        
        reviewSummaryLabel.attributedText = text.attribute(
            size: 17,
            lineSpacing: 10
        )
    }
    
    private func setInterviewQuestionLabel(by interviewQuestion: String) {
        interviewQuestionLabel.attributedText = interviewQuestion.attribute(
            size: 15,
            color: .darkGray,
            lineSpacing: 6
        )
    }
}
