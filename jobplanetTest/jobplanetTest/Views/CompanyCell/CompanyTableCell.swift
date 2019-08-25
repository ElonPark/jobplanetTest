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
import RxKingfisher

final class CompanyCell: UITableViewCell, View, UseCompositeDisposable {
    
    // MARK: UI
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateView: UIView!
    @IBOutlet weak var rateImageView: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var industryNameLabel: UILabel!
    
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
    var disposables: CompositeDisposable = CompositeDisposable()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initUI()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        dispose()
    }
    
    
    // MARK: Binding
    
    func bind(reactor: TableCellReactor<Company>) {
        reactor.state.map { $0.model }
            .distinctUntilChanged()
            .observeOn(MainScheduler.instance)
            .bind { [weak self] company in
                self?.setLogoImage(by: company.logoPath)
                self?.titleLabel.text = company.name
                self?.rateLabel.text = String(company.rateTotalAvg)
                self?.industryNameLabel.text = company.industryName
                self?.salaryAvgLabel.text = company.salaryAvg.withComma()
                self?.setReviewSummaryLabel(by: company.reviewSummary)
                self?.setReviewSummaryLabel(by: company.interviewQuestion)
            }
            .disposed(by: self.disposeBag)
    }
    
    
    // MARK: internal
    
    private func initUI() {
        logoImageView.image = nil
        titleLabel.text = ""
        rateView.backgroundColor = .clear
        rateImageView.image = nil
        rateLabel.text = ""
        industryNameLabel.text = ""
        reviewSummaryLabel.text = ""
        salaryAvgLabel.text = "0"
        interviewQuestionLabel.text = ""
    }
    
    private func setLogoImage(by urlString: String) {
        guard let url = URL(string: urlString) else { return }
        logoImageView.kf.rx.setImage(with: url)
            .subscribe()
            .disposed(by: disposables)
    }
    
    private func setReviewSummaryLabel(by review: String) {
        reviewSummaryLabel.attributedText = #""\#(review)""#.attribute(
            size: 15,
            weight: .light,
            lineSpacing: 3
        )
    }
    
    private func setInterviewQuestionLabel(by interviewQuestion: String) {
        interviewQuestionLabel.attributedText = interviewQuestion.attribute(
            size: 12,
            weight: .light,
            color: .darkGray,
            lineSpacing: 2
        )
    }
}
