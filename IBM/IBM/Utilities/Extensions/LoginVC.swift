//
//  LoginVC.swift
//  IBM
//
//  Created by Liu Fan Wei on 6/4/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit
import PKHUD

class LoginVC: UIViewController {
    
    private var email: String?
    private var pin: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onLoginClicked(_ sender: Any) {
        guard let pin = pin?.trimmingCharacters(in: .whitespacesAndNewlines),
            let email = email?.trimmingCharacters(in: .whitespacesAndNewlines),
            pin.count != 0,
            email.count != 0 else {
                HUD.flash(.label("Email and Pin can not be empty"))
                return
        }
        APIManager.shared.login(email, pin, apiCallSuccess: { [weak self] data in
            self?.performSegue(withIdentifier: "goMainPage", sender: nil)
        })
    }
}

extension LoginVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,with: string)
            if textField.tag == 1 {
                email = updatedText
            }else if textField.tag == 2 {
                pin = updatedText
            }
        }
        return true
    }
}
