//
//  GrayTextButton.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import UIKit

@IBDesignable
final class GrayTextButton: TrackerView {

    @IBOutlet weak var button: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.configureView()
    }
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "GrayTextButton")
        else { return }
        
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func configureButton(text: String) {
        self.button.setTitle(text, for: .normal)
    }
    
}
