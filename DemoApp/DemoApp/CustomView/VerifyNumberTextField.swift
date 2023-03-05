//
//  VerifyNumberTextField.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import UIKit

final class VerifyNumberTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureTextField()
    }
    
    
    private func configureTextField() {
        self.addGrayUnderline()
        self.keyboardType = .numberPad
        self.textAlignment = .center
    }

}
