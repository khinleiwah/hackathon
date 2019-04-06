//
//  Transaction.swift
//  IBM
//
//  Created by Kasun Ranasinghe on 4/6/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit

class Transaction: NSObject {
    var sourceAccount = Account()
    var destinationAccount = Account()
    var amount : Double = 0
    var receiveAmount : Double = 0
    var nicName : String = ""
    var ballance : Double = 0
    var date : Date = Date()
    var fee : Double = 0
    var recevingCurency: String = ""
    
    init(sourceAccount: Account,destinationAccount:Account,amount:Double,receiveAmount:Double,date:Date,fee:Double,recevingCurency:String) {
        self.sourceAccount = sourceAccount;
        self.destinationAccount = destinationAccount;
        self.amount = amount ;
        self.date = date;
        self.fee = fee;
        self.recevingCurency = recevingCurency;
    }
}
