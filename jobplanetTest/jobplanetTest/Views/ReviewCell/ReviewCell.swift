//
//  ReviewCell.swift
//  jobplanetTest
//
//  Created by Elon on 25/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift

class ReviewCell: UITableViewCell, NibLoadableView, ReactorKit.View, UseCompositeDisposable, HasShowMoreButton {

    @IBOutlet weak var titleView: CompanyInfoTitleView!
    
    @IBOutlet weak var reviewSummaryView: UIView!
    @IBOutlet weak var reviewSummaryLabel: UILabel!
    
    @IBOutlet weak var prosLabel: UILabel!
    @IBOutlet weak var consLabel: UILabel!
    
    @IBOutlet weak var showMoreButton: UIButton!
    
    
    // MARK: Properties
    
    var disposeBag: DisposeBag = DisposeBag()
    var disposables: CompositeDisposable = CompositeDisposable()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        reviewSummaryLabel.text = ""
        prosLabel.text = ""
        consLabel.text = ""
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dispose()
    }
    
    // MARK: Binding
    
    func bind(reactor: SectionItemReactor<Review>) {
        reactor.state.map { $0.model }
            .distinctUntilChanged()
            .observeOn(MainScheduler.instance)
            .bind { [weak self] reivew in
                self?.titleView.setLogoImage(by: reivew.logoPath)
                self?.titleView.titleLabel.text = reivew.name
                self?.titleView.rateLabel.text = String(reivew.rateTotalAvg)
                self?.titleView.industryNameLabel.text = reivew.industryName
                self?.setReviewSummaryLabel(by: reivew.reviewSummary)
                self?.setProsLabel(by: reivew.pros)
                self?.setConsLabel(by: reivew.cons)
            }
            .disposed(by: self.disposeBag)
    }
    
    // MARK: internal
    
    private func setReviewSummaryLabel(by review: String) {
        let text = review.isEmpty ? "" : #""\#(review)""#
        reviewSummaryLabel.attributedText = text.attribute(
            size: 17,
            weight: .semibold,
            lineSpacing: 10
        )
    }
    
    private func linespaceText(by string: String) -> NSAttributedString {
        return string.attribute(
            size: 16,
            lineSpacing: 6
        )
    }
    
    private func setProsLabel(by review: String) {
        prosLabel.attributedText = linespaceText(by: review)
    }
    
    private func setConsLabel(by review: String) {
        consLabel.attributedText = linespaceText(by: review)
    }
}
