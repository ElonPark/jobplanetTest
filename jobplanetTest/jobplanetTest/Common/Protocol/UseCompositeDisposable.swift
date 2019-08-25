//
//  UseCompositeDisposable.swift
//  jobplanetTest
//
//  Created by Elon on 24/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import RxSwift

protocol UseCompositeDisposable: class {
    var disposables: CompositeDisposable { get set }
    func dispose()
}

extension UseCompositeDisposable {
    
    func dispose() {
        disposables.dispose()
        disposables = CompositeDisposable()
    }
}
