//
//  SelectVC.swift
//  IBM
//
//  Created by Liu Fan Wei on 6/4/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit

class SelectVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "HeaderTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderTableViewCell")
    }
}
extension SelectVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath)
        }else if indexPath.row == 1 {
            let filterTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
//            filterTableViewCell.selectType(type: currentType)
//            filterTableViewCell.filterChangedCallBack = { [weak self] type in
//                self?.currentType = type
//                self?.tableView.reloadData()
//            }
            return filterTableViewCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
