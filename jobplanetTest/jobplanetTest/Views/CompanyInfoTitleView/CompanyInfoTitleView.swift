//
//  CompanyInfoTitleView.swift
//  jobplanetTest
//
//  Created by Elon on 25/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit
import Kingfisher

class CompanyInfoTitleView: UIView {

    let nibName = "CompanyInfoTitleView"
    var contentView: UIView?
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateView: UIView!
    @IBOutlet weak var rateImageView: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var industryNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        
        logoImageView.image = nil
        titleLabel.text = ""
        setRateView()
        rateLabel.text = ""
        industryNameLabel.text = ""
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    private func setRateView() {
        rateView.backgroundColor = .clear
        rateView.layer.masksToBounds = true
        rateView.layer.cornerRadius = rateView.bounds.size.height / 2
        rateView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.7).cgColor
        rateView.layer.borderWidth = 1
    }
    
    func setLogoImage(by urlString: String) {
        guard let url = URL(string: urlString) else { return }
        logoImageView.kf.setImage(with: url)
    }
}
