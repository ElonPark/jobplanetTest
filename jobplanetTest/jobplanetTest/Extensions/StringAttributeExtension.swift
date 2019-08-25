//
//  StringAttributeExtension.swift
//  jobplanetTest
//
//  Created by Elon on 24/08/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import UIKit

extension String {
    
    /**
     ## bold
     
     - Parameter size: 폰트 크기
     - Parameter color: 폰트 컬러
     */
    func bold(size fontSize: CGFloat, color: UIColor? = nil) -> NSMutableAttributedString {
        var attributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.boldSystemFont(ofSize: fontSize),
        ]
        
        if let fontColor = color {
            attributes[.foregroundColor] = fontColor
        }
        
        let attributeFont = NSMutableAttributedString(string: self, attributes: attributes)
        
        return attributeFont
    }
    
    /**
     ## light
     
     - Parameter size: 폰트 크기
     - Parameter color: 폰트 컬러
     */
    func light(size fontSize: CGFloat, color: UIColor? = nil) -> NSMutableAttributedString {
        var attributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: fontSize, weight: .light),
        ]
        
        if let fontColor = color {
            attributes[.foregroundColor] = fontColor
        }
        
        let attributeFont = NSMutableAttributedString(string: self, attributes: attributes)
        
        return attributeFont
    }
    
    /**
     ## 문자열 폰트 속성
     
     - Parameter size: 폰트 크기
     - Parameter weight: 폰트 패밀리는 폰트 크기를 반드시 넣어야 적용됨.
     - Parameter color: 폰트 컬러
     - Parameter lineSpacing: 줄 간격
     */
    func attribute(size: CGFloat? = nil, weight: UIFont.Weight? = nil, color: UIColor? = nil, lineSpacing: CGFloat? = nil) -> NSMutableAttributedString {
        var attributes = [NSAttributedString.Key : Any]()
        
        if let fontSize = size {
            attributes[.font] = UIFont.systemFont(ofSize: fontSize)
        }
        
        if let fontSize = size, let fontWeight = weight {
            attributes[.font] = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        }
        
        if let fontColor = color {
            attributes[.foregroundColor] = fontColor
        }
        
        if let spacing = lineSpacing {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = spacing
            
            attributes[.paragraphStyle] = paragraphStyle
        }
        
        let attributeFont = NSMutableAttributedString(string: self, attributes: attributes)
        
        return attributeFont
    }
}
