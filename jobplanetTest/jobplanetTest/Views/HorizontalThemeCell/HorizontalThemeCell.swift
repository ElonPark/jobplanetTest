//
//  HorizontalThemeCell.swift
//  jobplanetTest
//
//  Created by Elon on 25/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift
import RxCocoa
import ReusableKit

class HorizontalThemeCell: UITableViewCell, NibLoadableView, ReactorKit.View  {

    // MARK: UI
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    // - MARK: Constants
    
    struct Reusable {
        static let themeCell = ReusableCell<ThemeCollectionViewCell>(nibName: ThemeCollectionViewCell.nibName)
    }
    
    // MARK: Properties
    
    var disposeBag: DisposeBag = DisposeBag()
    var themes = BehaviorRelay(value: [Theme]())
    
    var collectionViewOffset: CGFloat {
        set {
            collectionView.contentOffset.x = newValue
        }
        
        get {
            return collectionView.contentOffset.x
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(Reusable.themeCell)
    }
    
    // MARK: Binding
    
    func bind(reactor: SectionItemReactor<HorizontalTheme>) {
        reactor.state.map { $0.model.themes }
            .distinctUntilChanged()
            .bind(to: themes)
            .disposed(by: self.disposeBag)
    }
}

extension HorizontalThemeCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themes.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(Reusable.themeCell, for: indexPath)
        cell.setUI(with: themes.value[indexPath.row])
        
        return cell
    }
}

extension HorizontalThemeCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row < themes.value.count else { return }
        let theme = themes.value[indexPath.item]
        Log.debug(theme.title)
    }
}
