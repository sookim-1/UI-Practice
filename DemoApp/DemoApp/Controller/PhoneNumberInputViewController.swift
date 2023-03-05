//
//  PhoneNumberInputViewController.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import UIKit

final class PhoneNumberInputViewController: TrackerViewController {

    @IBOutlet weak var customNavigationBarView: CustomNavigationBarView!
    @IBOutlet weak var nextButton: BasicButton!
    @IBOutlet weak var nextButtonBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var basicTextField: BasicTextField!
    
    @IBOutlet weak var globalNumberInputButton: GrayTextButton!
    @IBOutlet weak var modifyPhoneNumberButton: GrayTextButton!
    
    override func loadView() {
        super.loadView()
        
        configureUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        self.basicTextField.textField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    private func configureUI() {
        self.customNavigationBarView.delegate = self
        self.customNavigationBarView.configureNavigationBarView(title: "", type: .root)
        
        self.nextButton.delegate = self
        self.nextButton.configureButton(backgroundColor: .systemBlue, titleColor: .white, text: "다음", identifier: .next)
        
        self.globalNumberInputButton.configureButton(text: "해외 번호 입력하기 ＞")
        self.globalNumberInputButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchedGlobalNumberInputButton)))
        
        self.modifyPhoneNumberButton.configureButton(text: "가입 후 번호를 바꾸셨나요? ＞")
        self.modifyPhoneNumberButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchedModifyPhoneNumberButton)))
        
        self.basicTextField.textField.keyboardType = .numberPad
        self.basicTextField.textField.text = "010"
        self.basicTextField.configureTextFiled()
    }
    
    @objc private func touchedGlobalNumberInputButton() {
        print("1")
    }
    
    @objc private func touchedModifyPhoneNumberButton() {
        print("2")
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.33, animations: {
                self.nextButtonBottomConstraint.constant = CGFloat(Int(keyboardSize.height))
            }, completion: { _ in })
            
            self.view.layoutIfNeeded()
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            UIView.animate(withDuration: 0.33, animations: {
                self.nextButtonBottomConstraint.constant = 0
            }, completion: { _ in })
        }
        
        self.view.layoutIfNeeded()
    }
    
}

extension PhoneNumberInputViewController: BasicButtonDelegate {
    
    func touchedButton(type: BasicButton.Identifier) {
        switch type {
        case .next:
            pushToVerifyViewController()
        default:
            print("none 버튼")
        }
    }
    
    private func pushToVerifyViewController() {
        let sb = UIStoryboard(name: "VerifyViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "VerifyViewController") as! VerifyViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension PhoneNumberInputViewController: CustomNavigationBarViewDelegate {
    
    func touchedButton(type: CustomNavigationBarView.Identifier) {
        switch type {
        case .root:
            self.dismiss(animated: true)
        case .sub:
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
