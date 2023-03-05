//
//  ViewController.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import UIKit

final class LoginHomeViewController: TrackerViewController {

    @IBOutlet weak var signUpButton: BasicButton!
    @IBOutlet weak var loginButton: BasicButton!
    
    override func loadView() {
        super.loadView()
        
        configureUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func configureUI() {
        self.signUpButton.backgroundColor = .clear
        self.signUpButton.delegate = self
        self.signUpButton.configureButton(backgroundColor: .systemBlue, titleColor: .white, text: "가입하고 만원 쿠폰받기", identifier: .signUp)
        
        self.loginButton.backgroundColor = .clear
        self.loginButton.delegate = self
        self.loginButton.configureButton(backgroundColor: .systemGray5, titleColor: .systemBlue, text: "기존회원 로그인", identifier: .login)
    }


}

extension LoginHomeViewController: BasicButtonDelegate {
    
    func touchedButton(type: BasicButton.Identifier) {
        switch type {
        case .signUp:
            presentPhoneNumberInputViewController()
        case .login:
            presentPhoneNumberInputViewController()
        default:
            print("none Button")
        }
    }
    
    private func presentPhoneNumberInputViewController() {
        let sb = UIStoryboard(name: "PhoneNumberInputViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PhoneNumberInputNavigationViewController") as! UINavigationController
        
        vc.modalPresentationStyle = .overFullScreen
        
        self.present(vc, animated: true)
    }
    
}

