//
//  FilterTableViewCell.swift
//  IBM
//
//  Created by Liu Fan Wei on 6/4/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit

enum FilterType: Int {
    case week=1, month, range
}

typealias FilterChangedCallBack = (_ type: FilterType) -> Void

class FilterTableViewCell: UITableViewCell {

    var filterChangedCallBack: FilterChangedCallBack?
    @IBOutlet var filterButtons: [UIButton]!
    
    private var selectType = FilterType.week

    override func awakeFromNib() {
        super.awakeFromNib()
        updateButton()
    }

    func selectType(type: FilterType) {
        selectType = type
        updateButton()
    }

    @IBAction func onTypeChanged(_ sender: UIButton) {
        guard let type = FilterType.init(rawValue: sender.tag) else {
            return
        }
        
        if selectType != type {
            selectType = type
            filterChangedCallBack?(selectType)
            updateButton()
        }
    }
    
    private func updateButton() {
        let _ = filterButtons.map { (sender: UIButton) in
            guard let type = FilterType.init(rawValue: sender.tag) else {
                return
            }
           // sender.backgroundColor = selectType == type ? UIColor.init(rgb: 0x468DCC) : UIColor.lightGray
        }
    }
}
