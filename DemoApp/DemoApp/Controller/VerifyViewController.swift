//
//  VerifyViewController.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import UIKit

final class VerifyViewController: TrackerViewController {
    
    @IBOutlet weak var customNavigationBarView: CustomNavigationBarView!
    
    @IBOutlet weak var nextButton: BasicButton!
    @IBOutlet weak var nextButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var verifyDescriptionLabel: UILabel!
    
    @IBOutlet weak var firstNumberTextField: VerifyNumberTextField!
    @IBOutlet weak var secondTextField: VerifyNumberTextField!
    @IBOutlet weak var thirdTextField: VerifyNumberTextField!
    @IBOutlet weak var forthTextField: VerifyNumberTextField!
    @IBOutlet weak var fifthTextField: VerifyNumberTextField!
    @IBOutlet weak var sixTextField: VerifyNumberTextField!
    
    
    @IBOutlet var verifyTextFieldCollection: [VerifyNumberTextField]!
    
    
    override func loadView() {
        super.loadView()
        
        configureUI()
        configureDescriptionLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.verifyTextFieldCollection.forEach { item in
            item.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.firstNumberTextField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func configureUI() {
        self.customNavigationBarView.delegate = self
        self.customNavigationBarView.configureNavigationBarView(title: "", type: .sub)
        
        self.nextButton.delegate = self
        self.nextButton.configureButton(backgroundColor: .systemBlue, titleColor: .white, text: "다음", identifier: .next)
        
        self.nextButton.button.isEnabled = false
    }
    
    private func configureDescriptionLabel() {
        self.verifyDescriptionLabel.text = "010-1234-1234로 전송된 인증번호를 입력해 주세요."
        let fullText = self.verifyDescriptionLabel.text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let phoneNumberString = "010-1234-1234"
        
        let range = (fullText as NSString).range(of: phoneNumberString)
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: range)
        self.verifyDescriptionLabel.attributedText = attributedString
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

extension VerifyViewController: CustomNavigationBarViewDelegate {
    
    func touchedButton(type: CustomNavigationBarView.Identifier) {
        switch type {
        case .root:
            self.dismiss(animated: true)
        case .sub:
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}

extension VerifyViewController: BasicButtonDelegate {
    
    func touchedButton(type: BasicButton.Identifier) {
        switch type {
        case .next:
            pushToLoginViewController()
        default:
            print("none 버튼")
        }
    }
    
    private func pushToLoginViewController() {
        let sb = UIStoryboard(name: "LoginViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension VerifyViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
        currentString.replacingCharacters(in: range, with: string) as NSString
        
        changeGrayUnderline(textField)
        
        return newString.length <= maxLength
    }
    
    
    private func changeGrayUnderline(_ textField: UITextField) {
        let border = CALayer()
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - 1, width:  textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = 1
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    private func changeBlackUnderline(_ textField: UITextField) {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - borderWidth, width:  textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = borderWidth
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        let text = textField.text
        
        if text?.count == 1 {
            switch textField {
            case firstNumberTextField:
                secondTextField.becomeFirstResponder()
            case secondTextField:
                thirdTextField.becomeFirstResponder()
            case thirdTextField:
                forthTextField.becomeFirstResponder()
            case forthTextField:
                fifthTextField.becomeFirstResponder()
            case fifthTextField:
                sixTextField.becomeFirstResponder()
            case sixTextField:
                self.nextButton.button.isEnabled = true
            default:
                break
            }
        }
        
        if text?.count == 0 {
            switch textField {
            case firstNumberTextField:
                firstNumberTextField.becomeFirstResponder()
            case secondTextField:
                firstNumberTextField.becomeFirstResponder()
            case thirdTextField:
                secondTextField.becomeFirstResponder()
            case forthTextField:
                thirdTextField.becomeFirstResponder()
            case fifthTextField:
                forthTextField.becomeFirstResponder()
            case sixTextField:
                self.nextButton.button.isEnabled = false
                fifthTextField.becomeFirstResponder()
            default:
                break
            }
        }
    }
    
}
