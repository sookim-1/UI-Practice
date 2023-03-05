//
//  BasicButton.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import UIKit

protocol BasicButtonDelegate: AnyObject {
    func touchedButton(type: BasicButton.Identifier)
}

@IBDesignable
final class BasicButton: TrackerView {

    enum Identifier {
        case signUp
        case login
        case next
        case none
    }
    
    @IBOutlet weak var button: UIButton!
    weak var delegate: BasicButtonDelegate?
    private var buttonIdentifier: Identifier = .none
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.configureView()
    }
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "BasicButton")
        else { return }
        
        view.frame = self.bounds
        view.backgroundColor = .clear
        self.addSubview(view)
    }
    
    func configureButton(backgroundColor: UIColor, titleColor: UIColor, text: String, identifier: Identifier) {
        self.button.backgroundColor = backgroundColor
        self.button.setTitleColor(titleColor, for: .normal)
        self.button.setTitle(text, for: .normal)
        self.buttonIdentifier = identifier
        
        if identifier != .next {
            self.button.layer.cornerRadius = 8
        }
    }
    
    @IBAction func touchedButton(_ sender: UIButton) {
        delegate?.touchedButton(type: self.buttonIdentifier)
    }
    
}
