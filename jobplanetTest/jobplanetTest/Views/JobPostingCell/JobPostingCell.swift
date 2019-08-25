//
//  JobPostingCell.swift
//  jobplanetTest
//
//  Created by Elon on 25/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift
import Kingfisher

class JobPostingCell: UITableViewCell, NibLoadableView, ReactorKit.View, UseCompositeDisposable {

    // MARK: UI
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateView: UIView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    
    // MARK: Properties
    
    var disposeBag: DisposeBag = DisposeBag()
    var disposables: CompositeDisposable = CompositeDisposable()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        logoImageView.image = nil
        nameLabel.text = ""
        titleLabel.text = ""
        rateLabel.text = ""
        rateView.backgroundColor = .clear
        messageLabel.text = ""
        
        // FIXME: 신입/경력 구분
        typeLabel.text = "경력"
        typeView.layer.masksToBounds = true
        typeView.layer.cornerRadius = 3
        typeView.layer.borderColor = UIColor.lightGray.cgColor
        typeView.layer.borderWidth = 0.3
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dispose()
    }
    
    
    // MARK: Binding
    
    func bind(reactor: SectionItemReactor<JobPosting>) {
        reactor.state.map { $0.model }
            .distinctUntilChanged()
            .observeOn(MainScheduler.instance)
            .bind { [weak self] jobPosting in
                self?.setLogoImage(by: jobPosting.logo)
                self?.nameLabel.text = jobPosting.companyName
                self?.titleLabel.text = jobPosting.title
                self?.rateLabel.text = String(jobPosting.reviewAvgCache)
                self?.messageLabel.text = jobPosting.deadline.message
                self?.messageLabel.textColor = UIColor(hex: jobPosting.deadline.hexColor)
                let isSaved = Bool(jobPosting.isSaved) ?? false
                self?.saveButton.isEnabled = isSaved
            }
            .disposed(by: self.disposeBag)
    }
    
    func setLogoImage(by urlString: String) {
        guard let url = URL(string: urlString) else { return }
        logoImageView.kf.setImage(with: url)
    }
    
}
