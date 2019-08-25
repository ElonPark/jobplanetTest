//
//  UIViewControllerExtension.swift
//  jobplanetTest
//
//  Created by Elon on 26/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case main = "Main"
}

extension UIViewController {
    
    static func instantiate<T: UIViewController>(by storyboardName: Storyboard) -> T? {
        let type = String(describing: T.Type.self)
        guard let identifier = type.components(separatedBy: ".").first else { return nil }
        
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        
        return vc as? T
    }
}
