//
//  InputVC.swift
//  IBM
//
//  Created by Win on 6/4/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit

class InputVC: UIViewController {
    
    var sendAmount:Double = 0.0
    
    @IBOutlet weak var serviceFeeLabel: UILabel!
    @IBOutlet weak var exchageRateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        self.tableView.register(UINib.init(nibName: "InputTableViewCell", bundle: nil), forCellReuseIdentifier: "InputTableViewCell")
        
        
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
//    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
//        arrary[textfield.tag] = textfield.text
//    }
    
//    private func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        return false
//    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //if let amount = Double(textField.text) {
        
//            self.sendAmount = amount
//        }
        return true
    }
}

extension InputVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 2) {
             return tableView.dequeueReusableCell(withIdentifier: "InputTableViewCell", for: indexPath)
        }
        return tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath)

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
