//
//  ThemeCollectionViewCell.swift
//  jobplanetTest
//
//  Created by Elon on 25/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit
import Kingfisher

final class ThemeCollectionViewCell: UICollectionViewCell, NibLoadableView {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initUI()
    }
    
    private func initUI() {
        coverImageView.image = nil
        titleLabel.text = ""
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        initUI()
        coverImageView.kf.cancelDownloadTask()
    }
    
    func setUI(with theme: Theme) {
        titleLabel.text = theme.title
        
        imageBackgroundView.backgroundColor = UIColor(hex: theme.color)
        
        guard let url = URL(string: theme.coverImage) else { return }
        coverImageView.kf.setImage(with: url) { [weak self] result in
            switch result {
            case .success(_):
                break
                
            case .failure(let error):
                Log.error(error.localizedDescription)
                self?.coverImageView.image = nil
            }
        }
    }
}
