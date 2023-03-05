//
//  CustomNavigationBarView.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import UIKit

protocol CustomNavigationBarViewDelegate: AnyObject {
    func touchedButton(type: CustomNavigationBarView.Identifier)
}

@IBDesignable
final class CustomNavigationBarView: TrackerView {

    @IBOutlet weak var titleLabel: UILabel!
    private var type: CustomNavigationBarView.Identifier = .sub
    weak var delegate: CustomNavigationBarViewDelegate?
    
    enum Identifier {
        case root
        case sub
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureView()
    }
    
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "CustomNavigationBarView")
        else { return }
        
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func configureNavigationBarView(title: String, type: CustomNavigationBarView.Identifier) {
        self.titleLabel.text = title
        self.type = type
    }
    
    @IBAction func touchedButton(_ sender: UIButton) {
        delegate?.touchedButton(type: self.type)
    }
    
}
