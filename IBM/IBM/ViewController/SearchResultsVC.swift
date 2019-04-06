//
//  SearchResultsVC.swift
//  IBM
//
//  Created by Liu Fan Wei on 6/4/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit

class SearchResultsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "DisplayTableViewCell", bundle: nil), forCellReuseIdentifier: "DisplayTableViewCell")
        tableView.register(UINib.init(nibName: "SearchHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "SearchHeader")
    }
    
    @IBAction func onGoHomeClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SearchResultsVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SearchHeader")
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "DisplayTableViewCell", for: indexPath)
    }
}
