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
    var transactionRate: Double = 1
    var referenceNo: String = ""
    
    
    override init() {
        super.init()
    }
    
    init(sourceAccount: Account,destinationAccount:Account,amount:Double,receiveAmount:Double,date:Date,fee:Double,recevingCurency:String,transactionRate:Double) {
        super.init()
        self.sourceAccount = sourceAccount;
        self.destinationAccount = destinationAccount;
        self.amount = amount ;
        self.date = date;
        self.fee = fee;
        self.recevingCurency = recevingCurency;
        self.referenceNo = randomString(length: 10);
    }
    
    //use for references in transactions
    func randomString(length: Int) -> String {
        
        let letters : NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        var randomString = ""
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        return randomString
    }
}
