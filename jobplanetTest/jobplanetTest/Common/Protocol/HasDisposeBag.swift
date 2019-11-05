//
//  HasDisposeBag.swift
//  jobplanetTest
//
//  Created by elon on 05/11/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import RxSwift

protocol HasDisposeBag {
    var disposeBag: DisposeBag { set get }
}
