//
//  InterviewCell.swift
//  jobplanetTest
//
//  Created by Elon on 25/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift

final class InterviewCell: UITableViewCell, NibLoadableView, ReactorKit.View, HasShowMoreButton {

    // MARK: UI
    
    @IBOutlet weak var titleView: CompanyInfoTitleView!
    @IBOutlet weak var interviewQuestionView: UIView!
    @IBOutlet weak var interviewQuestionTitleLabel: UILabel!
    @IBOutlet weak var interviewQuestionLabel: UILabel!
    @IBOutlet weak var interviewDifficultyView: UIView!
    @IBOutlet weak var interviewDifficultyTitleLabel: UILabel!
    @IBOutlet weak var interviewDifficultyLabel: UILabel!
    
    @IBOutlet weak var showMoreButton: UIButton!
    
    
    // MARK: Properties
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        interviewQuestionLabel.text = ""
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    // MARK: Binding
    
    func bind(reactor: SectionItemReactor<Interview>) {
        reactor.state.map { $0.model }
            .distinctUntilChanged()
            .observeOn(MainScheduler.instance)
            .bind { [weak self] interview in
                guard let self = self else { return }
                self.titleView.setLogoImage(by: interview.logoPath)
                self.titleView.titleLabel.text = interview.name
                self.titleView.rateLabel.text = String(interview.rateTotalAvg)
                self.titleView.industryNameLabel.text = interview.industryName
                self.setInterviewQuestionLabel(by: interview.interviewQuestion)
                self.interviewDifficultyLabel.text = String(interview.interviewDifficulty)
            }
            .disposed(by: self.disposeBag)
    }
    
    private func setInterviewQuestionLabel(by interviewQuestion: String) {
        let text = interviewQuestion.isEmpty ? "" : #""\#(interviewQuestion)""#
        
        interviewQuestionLabel.attributedText = text.attribute(
            size: 17,
            color: .darkGray,
            lineSpacing: 10
        )
    }
}
