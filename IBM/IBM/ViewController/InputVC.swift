//
//  InputVC.swift
//  IBM
//
//  Created by Win on 6/4/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit

class InputVC: UIViewController {
    
    @IBOutlet weak var serviceFeeLabel: UILabel!
    @IBOutlet weak var exchageRateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "HeaderTableViewCell", bundle: nil)
        
        
        //tableView.register(nib, forCellReuseIdentifier: staticVariable.PeakInfoCellIdentifier)
        
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
