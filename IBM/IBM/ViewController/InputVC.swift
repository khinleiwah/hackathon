//
//  InputVC.swift
//  IBM
//
//  Created by Win on 6/4/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit

protocol InputDataDelegate {
    func fillData(account:Account)
    func fillDestData(account: Account)
}

class InputVC: UIViewController,InputDataDelegate {

    var sourceAccount:Account?
    var destAccount:Account?
    var sendAmount:Double = 0.0
    //var transAmount:Double = 0.0
    var trans : Transaction?
    
    let manager = TransactionManager.shared
    
    @IBOutlet weak var serviceFeeLabel: UILabel!
    @IBOutlet weak var exchageRateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        self.tableView.register(UINib.init(nibName: "InputTableViewCell", bundle: nil), forCellReuseIdentifier: "InputTableViewCell")
    }
    
    func fillData(account: Account) {
        self.sourceAccount = account
    }
    func fillDestData(account: Account) {
        self.destAccount = account
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension InputVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let amount = textField.text {
            self.sendAmount = Double(amount)!
            let trans = self.manager.calculateTransaction(sourceAccount: self.sourceAccount!, desticationAccount: self.destAccount!, Amount: self.sendAmount)
            self.trans = trans
            
            self.tableView.reloadData()
        }
        return true
    }
}

extension InputVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0 || indexPath.row == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as? HeaderTableViewCell
            cell!.accessoryType = .disclosureIndicator
            if(indexPath.row == 0) {
                if let source = self.sourceAccount {
                    cell?.descriptionLabel.text = source.accountNo
                }
            } else {
                if let dest = self.destAccount {
                    cell?.descriptionLabel.text = dest.accountNo
                }
            }
            return cell!
        }
        else if (indexPath.row == 2) {
             let cell = tableView.dequeueReusableCell(withIdentifier: "InputTableViewCell", for: indexPath) as? InputTableViewCell
            cell?.inputTextField.delegate = self
            return cell!
        }
        else if (indexPath.row == 3) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as? HeaderTableViewCell
            if let receiveAmt = self.trans?.receiveAmount {
                cell?.descriptionLabel.text = "\(receiveAmt)"
            }
            return cell!
        }
        return tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0) {
            self.performSegue(withIdentifier: "sourceSegue", sender: self)
        }
        else if (indexPath.row == 1) {
            self.performSegue(withIdentifier: "destSegue", sender: self)
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "sourceSegue") {
            if let vc = segue.destination as? SelectAccountTableVC {
                vc.delegate = self
                vc.isSource = true
            }
        }
        if (segue.identifier == "destSegue") {
            if let vc = segue.destination as? SelectAccountTableVC {
                vc.delegate = self
                vc.isSource = false
            }
        }
    }
}
