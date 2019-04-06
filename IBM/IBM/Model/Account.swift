//
//  Account.swift
//  IBM
//
//  Created by Kasun Ranasinghe on 4/6/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit

class Account: NSObject {
    
    var accountId : String = ""
    var accountNo : String = ""
    var accountType : String = ""
    var holderName : String = ""
    var nicName : String = ""
    var ballance : Double = 0
    var countryId : Int = 0
    var isIBankRemitanceAvailable: Bool = true;
    
    override init() {
        
    }

    init(accountNo: String,nicName:String,accountType:String,ballance:Double,countryId:Int,isIBankRemitanceAvailable:Bool) {
        self.accountNo = accountNo;
        self.nicName = nicName;
        self.accountType = accountType;
        self.ballance = ballance;
        self.countryId = countryId;
        self.isIBankRemitanceAvailable = isIBankRemitanceAvailable;
    }
    
    func getBalance () -> Double {
        return self.ballance;
    }
    
    
    
    
}
