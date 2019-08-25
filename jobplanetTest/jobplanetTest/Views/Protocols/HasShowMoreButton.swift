//
//  HasShowMoreButton.swift
//  jobplanetTest
//
//  Created by Elon on 25/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit
import RxSwift

protocol HasShowMoreButton: UseCompositeDisposable {
    var showMoreButton: UIButton! { get set }
}
