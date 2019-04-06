//
//  LoginVC.swift
//  IBM
//
//  Created by Liu Fan Wei on 6/4/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onLoginClicked(_ sender: Any) {
        APIManager.shared.login("", "", apiCallSuccess: { [weak self] data in
          self?.performSegue(withIdentifier: "goMainPage", sender: nil)
        })
    }
    
    
    // MARK: - Navigation
     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}
