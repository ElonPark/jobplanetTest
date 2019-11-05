//
//  SalaryCell.swift
//  jobplanetTest
//
//  Created by Elon on 25/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift

final class SalaryCell: UITableViewCell, NibLoadableView, ReactorKit.View, HasShowMoreButton {

    // MARK: UI
    
    @IBOutlet weak var titleView: CompanyInfoTitleView!
    @IBOutlet weak var salaryAvgLabel: UILabel!
    
    @IBOutlet weak var salaryProgressView: UIView!
    @IBOutlet weak var salaryMinLabel: UILabel!
    @IBOutlet weak var salaryMaxLabel: UILabel!
    
     @IBOutlet weak var showMoreButton: UIButton!
    
    // MARK: Properties
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        salaryAvgLabel.text = ""
        salaryMinLabel.text = ""
        salaryMaxLabel.text = ""
        
        salaryProgressView.layer.masksToBounds = true
        salaryProgressView.layer.cornerRadius = salaryProgressView.bounds.size.height / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    
    // MARK: Binding
    
    func bind(reactor: SectionItemReactor<Salary>) {
        reactor.state.map { $0.model }
            .distinctUntilChanged()
            .observeOn(MainScheduler.instance)
            .bind { [weak self] salary in
                guard let self = self else { return }
                self.titleView.setLogoImage(by: salary.logoPath)
                self.titleView.titleLabel.text = salary.name
                self.titleView.rateLabel.text = String(salary.rateTotalAvg)
                self.titleView.industryNameLabel.text = salary.industryName
                self.salaryAvgLabel.text = salary.salaryAvg.withComma()
                self.salaryMinLabel.text = salary.salaryLowest.withComma()
                self.salaryMaxLabel.text = salary.salaryHighest.withComma()
        }
        .disposed(by: self.disposeBag)
    }
}
