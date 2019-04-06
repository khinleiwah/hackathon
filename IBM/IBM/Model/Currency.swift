//
//  Currency.swift
//  IBM
//
//  Created by Kasun Ranasinghe on 4/6/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit

class Currency: NSObject {

    var countryId: Int = 0
    var currency: String = ""
    var rate: Double = 0
    
    override init() {
        
    }
    
     init(countryId:Int,currency:String,rate:Double) {
        self.countryId = countryId;
        self.currency = currency;
        self.rate = rate;
    }
    
}
