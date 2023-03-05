//
//  LoginViewController.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import UIKit

final class LoginViewController: TrackerViewController {

    @IBOutlet weak var customNavigationBarView: CustomNavigationBarView!
    @IBOutlet weak var nextButton: BasicButton!
    @IBOutlet weak var nextButtonBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var phoneNumberTextField: BasicTextField!
    @IBOutlet weak var passwordTextField: PasswordTextField!
    
    @IBOutlet weak var findPasswordButton: GrayTextButton!
    @IBOutlet weak var findEmailButton: GrayTextButton!
    
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
        self.passwordTextField.textField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    private func configureUI() {
        self.customNavigationBarView.delegate = self
        self.customNavigationBarView.configureNavigationBarView(title: "", type: .sub)
        
        self.nextButton.delegate = self
        self.nextButton.configureButton(backgroundColor: .systemBlue, titleColor: .white, text: "로그인", identifier: .next)
        
        self.findPasswordButton.configureButton(text: "비밀번호 찾기 ＞")
        self.findPasswordButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchedFindPasswordButton)))
        
        self.findEmailButton.configureButton(text: "가입한 적이 없어요 ＞")
        self.findEmailButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchedFindEmailButton)))

        
        self.phoneNumberTextField.textField.text = "010-1234-1234"
        self.phoneNumberTextField.configureTextFiled()
    }
    
    @objc private func touchedFindPasswordButton() {
        print("1")
    }
    
    @objc private func touchedFindEmailButton() {
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

extension LoginViewController: BasicButtonDelegate {
    
    func touchedButton(type: BasicButton.Identifier) {
        switch type {
        case .next:
            print("로그인 성공")
        default:
            print("none 버튼")
        }
    }
    
}

extension LoginViewController: CustomNavigationBarViewDelegate {
    
    func touchedButton(type: CustomNavigationBarView.Identifier) {
        switch type {
        case .root:
            self.dismiss(animated: true)
        case .sub:
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}

