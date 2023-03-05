//
//  BasicTextField.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import UIKit

@IBDesignable
final class BasicTextField: TrackerView {

    @IBOutlet weak var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureView()
        self.addUnderLine()
        self.addLeftPadding()
        self.addRightPadding()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.configureView()
        self.addUnderLine()
        self.addLeftPadding()
        self.addRightPadding()
    }
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "BasicTextField")
        else { return }
        
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    private func addUnderLine() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.size.height-1, width: self.frame.width, height: 1)
        border.borderWidth = 2
        border.backgroundColor = UIColor.black.cgColor
        self.textField.layer.addSublayer(border)
    }
    
    func configureTextFiled() {
        self.textField.clearButtonMode = .whileEditing
    }
    
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.textField.leftView = paddingView
        self.textField.leftViewMode = .always
    }
    
    func addRightPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.textField.rightView = paddingView
        self.textField.leftViewMode = .always
    }
    
}
