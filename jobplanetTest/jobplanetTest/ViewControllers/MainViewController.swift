//
//  MainViewController.swift
//  jobplanetTest
//
//  Created by Elon on 21/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit
import RxSwift
import RxOptional
import RxCocoa
import RxDataSources
import ReactorKit
import ReusableKit
import NVActivityIndicatorView

final class MainViewController: UIViewController, StoryboardView {
    
    // MARK: UI
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // - MARK: Constants
    
    struct Reusable {
        static let companyCell = ReusableCell<CompanyCell>(nibName: CompanyCell.nibName)
         static let horizontalThemeCell = ReusableCell<HorizontalThemeCell>(nibName: HorizontalThemeCell.nibName)
          static let interviewCell = ReusableCell<InterviewCell>(nibName: InterviewCell.nibName)
        static let jobPostingCell = ReusableCell<JobPostingCell>(nibName: JobPostingCell.nibName)
        static let reviewCell = ReusableCell<ReviewCell>(nibName: ReviewCell.nibName)
        static let salaryCell = ReusableCell<SalaryCell>(nibName: SalaryCell.nibName)
    }
    
    
    // MARK: Properties
    
    var disposeBag: DisposeBag = DisposeBag()
    private var storedOffsets = [Int : CGFloat]()
    
    private var itemSelected = PublishRelay<IndexPath>()
    private var themeSelected = PublishRelay<(IndexPath, IndexPath)>()
    
    typealias MainDataSource = RxTableViewSectionedReloadDataSource<MainViewSection>
    
    private let dataSource = MainDataSource(configureCell: { dataSource, tableView, indexPath, sectionItem in
        switch sectionItem {
        case .company(let reactor):
            let cell = tableView.dequeue(Reusable.companyCell, for: indexPath)
            cell.reactor = reactor
            return cell
            
        case .horizontalTheme(let reactor):
            let cell = tableView.dequeue(Reusable.horizontalThemeCell, for: indexPath)
            cell.reactor = reactor
            return cell
            
        case .interview(let reactor):
            let cell = tableView.dequeue(Reusable.interviewCell, for: indexPath)
            cell.reactor = reactor
            return cell
            
        case .jobPosting(let reactor):
            let cell = tableView.dequeue(Reusable.jobPostingCell, for: indexPath)
            cell.reactor = reactor
            return cell
            
        case .review(let reactor):
            let cell = tableView.dequeue(Reusable.reviewCell, for: indexPath)
            cell.reactor = reactor
            return cell
            
        case .salary(let reactor):
            let cell = tableView.dequeue(Reusable.salaryCell, for: indexPath)
            cell.reactor = reactor
            return cell
        }
    })
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        bindTableViewWillDisplayCell()
        bindTableViewDidEndDisplayingCell()
        bindTableViewItemSelected()
    }
    
    func bind(reactor: MainViewReactor) {

        // Input
       
        Observable.just(Reactor.Action.loadData)
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        itemSelected
            .map(Reactor.Action.itemSelected)
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        themeSelected
            .map(Reactor.Action.themeSelected)
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        // Output
        
        reactor.state.map { $0.isLoading }
            .distinctUntilChanged()
            .bind { [weak self] isLoading in
                self?.setLoadingIndicator(isLoading)
            }
            .disposed(by: self.disposeBag)
        
        reactor.state.map { $0.sections }
            .distinctUntilChanged()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)
        
        reactor.state.map { $0.selectedItem }
            .filterNil()
            .observeOn(MainScheduler.instance)
            .bind { [weak self] item in
                let reactor = DetailViewReactor(item: item)
                self?.moveToDetailVC(with: reactor)
            }
            .disposed(by: self.disposeBag)
        
        reactor.state.map { $0.selectedTheme }
            .filterNil()
            .filter { $0.item != nil }
            .map { (item: $0.item!, index: $0.themeIndex) }
            .observeOn(MainScheduler.instance)
            .bind { [weak self] section in
                let reactor = DetailViewReactor(item: section.item, themeIndex: section.index.item)
                self?.moveToDetailVC(with: reactor)
            }
            .disposed(by: self.disposeBag)
    }
    
    private func moveToDetailVC(with reactor: DetailViewReactor) {
        guard let detailVC: DetailViewController = UIViewController.instantiate(by: .main) else { return }
        detailVC.reactor = reactor
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: internal
    
    private func setTableView() {
        tableView.register(Reusable.companyCell)
        tableView.register(Reusable.horizontalThemeCell)
        tableView.register(Reusable.interviewCell)
        tableView.register(Reusable.jobPostingCell)
        tableView.register(Reusable.reviewCell)
        tableView.register(Reusable.salaryCell)
    }
    
    private func bindTableViewWillDisplayCell() {
        tableView.rx.willDisplayCell
            .asDriver()
            .drive(onNext: { [weak self] cell, indexPath in
                self?.setHorizontalCellScrollOffset(cell, with: indexPath)
                self?.setBindCellDidSeletecdTheme(cell, with: indexPath)
                self?.bindTableViewCellShowMoreButtonDidTap(cell, with: indexPath)
            })
            .disposed(by: disposeBag)
    }
    
    private func bindTableViewDidEndDisplayingCell() {
        tableView.rx.didEndDisplayingCell
        .asDriver()
        .drive(onNext: { [weak self] cell, indexPath in
            self?.setStoredOffsets(cell, with: indexPath)
        })
        .disposed(by: disposeBag)
    }
    
    private func setHorizontalCellScrollOffset(_ cell: UITableViewCell, with indexPath: IndexPath) {
        guard let horizontalCell = cell as? HorizontalThemeCell else { return }
        horizontalCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    private func setStoredOffsets(_ cell: UITableViewCell, with indexPath: IndexPath) {
        guard let horizontalCell = cell as? HorizontalThemeCell else { return }
        storedOffsets[indexPath.row] = horizontalCell.collectionViewOffset
    }
    
    private func setBindCellDidSeletecdTheme(_ cell: UITableViewCell, with indexPath: IndexPath) {
        guard let horizontalCell = cell as? HorizontalThemeCell else { return }
        horizontalCell.selectedTheme
            .bind { [weak self] themeIndex in
                guard let index = themeIndex.value else { return }
                self?.themeSelected.accept((indexPath, index))
            }
            .disposed(by: horizontalCell.disposables)
    }
    
    private func bindTableViewCellShowMoreButtonDidTap(_ cell: UITableViewCell, with indexPath: IndexPath) {
        guard let cell = cell as? HasShowMoreButton else { return }
        cell.showMoreButton.rx.tap
            .map { _ in indexPath }
            .bind(to: itemSelected)
            .disposed(by: cell.disposables)
    }
    
    private func bindTableViewItemSelected() {
        tableView.rx.itemSelected
            .asObservable()
            .bind(to: itemSelected)
            .disposed(by: disposeBag)
    }
}

extension MainViewController: NVActivityIndicatorViewable {
    
    private func startLoading() {
        guard !isAnimating else { return }
        startAnimating()
    }
    
    private func endLoading() {
        guard isAnimating else { return }
        stopAnimating()
    }
    
    private func setLoadingIndicator(_ isLoading: Bool) {
        if isLoading {
            startLoading()
        } else {
            endLoading()
        }
    }
}
