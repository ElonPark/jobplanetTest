//
//  IntExtension.swift
//  jobplanetTest
//
//  Created by Elon on 24/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import Foundation

extension Int {
    func withComma() -> String {
        let format = NumberFormatter()
        format.numberStyle = .decimal
       
        return format.string(from: NSNumber(value: self))!
    }
}
