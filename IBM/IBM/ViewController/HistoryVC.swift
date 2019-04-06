//
//  HistoryVC.swift
//  IBM
//
//  Created by Liu Fan Wei on 6/4/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var currentType = FilterType.week
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: "DisplayTableViewCell", bundle: nil), forCellReuseIdentifier: "DisplayTableViewCell")
        tableView.register(UINib.init(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        tableView.register(UINib.init(nibName: "FilterTableViewCell", bundle: nil), forCellReuseIdentifier: "FilterTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath)
        }else if indexPath.row == 1 {
            let filterTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
            filterTableViewCell.selectType(type: currentType)
            filterTableViewCell.filterChangedCallBack = { [weak self] type in
                self?.currentType = type
                self?.tableView.reloadData()
            }
            return filterTableViewCell
        }else {
            return tableView.dequeueReusableCell(withIdentifier: "DisplayTableViewCell", for: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
