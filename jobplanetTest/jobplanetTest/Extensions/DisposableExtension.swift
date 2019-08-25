//
//  DisposableExtension.swift
//  jobplanetTest
//
//  Created by Elon on 24/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import RxSwift

extension Disposable {
    
    /// Adds `self` to `CompositeDisposable`
    ///
    /// - parameter disposables: `CompositeDisposable` to add `self` to.
    func disposed(by disposables: CompositeDisposable) {
        _ = disposables.insert(self)
    }
}
