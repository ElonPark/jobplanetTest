//
//  MainViewController.swift
//  jobplanetTest
//
//  Created by Elon on 21/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift
import RxViewController
import NVActivityIndicatorView

final class MainViewController: UIViewController, StoryboardView {
    
    private let reactor = MainViewReactor(networkService: NetworkService(networking: Networking<JobplanetAPI>()))
    var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func bind(reactor: MainViewReactor) {
        
        // Input
        
        self.rx.viewDidLoad
            .map { Reactor.Action.loadData }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // Output
        
        reactor.state
            .map { $0.isLoading }
            .bind { [weak self] isLoading in
                self?.setLoadingIndicator(isLoading)
            }
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
