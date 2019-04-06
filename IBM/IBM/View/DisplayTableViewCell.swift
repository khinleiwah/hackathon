//
//  DisplayTableViewCell.swift
//  IBM
//
//  Created by Win on 6/4/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit

class DisplayTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var constraintDescriptionLable: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(_ data: Transaction) {
        titleLabel.text = String(data.sourceAccount.nicName)
        descriptionLabel.text = String(data.sourceAccount.accountType) + " (" + String(data.sourceAccount.accountNo) + ")"
        dataLabel.text = String(data.amount)
    }
    
    func setVisibleDataLabel(_ isVisible: Bool) {
        dataLabel.isHidden = !isVisible
        constraintDescriptionLable.constant = isVisible ? 24 : 16
    }
    
}
