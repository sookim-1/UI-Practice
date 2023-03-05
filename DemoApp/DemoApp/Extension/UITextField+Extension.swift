//
//  UITextField+Extension.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import UIKit

extension UITextField {
    
    func addUnderLine() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.size.height-1, width: self.frame.width, height: 1)
        border.borderWidth = 2
        border.backgroundColor = UIColor.black.cgColor
        self.layer.addSublayer(border)
    }
    
    func addGrayUnderline() {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func removeUnderLine() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.size.height-1, width: self.frame.width, height: 1)
        border.borderWidth = 2
        border.backgroundColor = UIColor.systemGray.cgColor
        self.layer.addSublayer(border)
    }
    
}
