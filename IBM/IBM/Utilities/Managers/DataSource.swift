//
//  DataSource.swift
//  IBM
//
//  Created by Kasun Ranasinghe on 4/6/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    
    static let shared = DataSource.init()
    
    var name = ""
    var pin = ""

    func getAccounts() -> [Account] {
      let acc1 = Account(accountNo: "123-132-121", nicName: "Mysaving", accountType: "Saving", ballance: 34522.56, countryId: 1,isIBankRemitanceAvailable: true)
      let acc2 = Account(accountNo: "255-132-345", nicName: "Wifes saving", accountType: "Current", ballance: 34522.56, countryId: 2,isIBankRemitanceAvailable: true)
      let acc3 = Account(accountNo: "154-342-121", nicName: "My ABC Bank", accountType: "Saving", ballance: 34522.56, countryId: 1,isIBankRemitanceAvailable: true)
      let acc4 = Account(accountNo: "556-234-121", nicName: "My iBank", accountType: "Saving", ballance: 34522.56, countryId: 1,isIBankRemitanceAvailable: true)
      let acc5 = Account(accountNo: "876-365-121", nicName: "Mothers Saving", accountType: "Saving", ballance: 34522.56, countryId: 5,isIBankRemitanceAvailable: false)
      return [acc1,acc2,acc3,acc4,acc5]
    }
    
    func getTrasactionHistory() -> [Transaction] {
        let acounts = getAccounts()
        let trn1 = Transaction(sourceAccount: acounts[0], destinationAccount: acounts[1], amount: 2334.566, receiveAmount: 1223.55, date: Date(), fee: 0.00, recevingCurency: "")
        let trn2 = Transaction(sourceAccount: acounts[0], destinationAccount: acounts[1], amount: 234.566, receiveAmount: 1223.55, date: Date(), fee: 11.00, recevingCurency: "")
        let trn3 = Transaction(sourceAccount: acounts[0], destinationAccount: acounts[1], amount: 5334.566, receiveAmount: 1223.55, date: Date(), fee: 11.00, recevingCurency: "")
        let trn4 = Transaction(sourceAccount: acounts[0], destinationAccount: acounts[1], amount: 4434.566, receiveAmount: 1223.55, date: Date(), fee: 11.00, recevingCurency: "")
        let trn5 = Transaction(sourceAccount: acounts[0], destinationAccount: acounts[1], amount: 634.566, receiveAmount: 1223.55, date: Date(), fee: 11.00, recevingCurency: "")
       let trn6 = Transaction(sourceAccount: acounts[0], destinationAccount: acounts[1], amount: 634.566, receiveAmount: 1223.55, date: Date(), fee: 11.00, recevingCurency: "")
        let trn7 = Transaction(sourceAccount: acounts[0], destinationAccount: acounts[1], amount: 634.566, receiveAmount: 1223.55, date: Date(), fee: 11.00, recevingCurency: "")
        let trn8 = Transaction(sourceAccount: acounts[0], destinationAccount: acounts[1], amount: 634.566, receiveAmount: 1223.55, date: Date(), fee: 11.00, recevingCurency: "")
        let trn9 = Transaction(sourceAccount: acounts[0], destinationAccount: acounts[1], amount: 634.566, receiveAmount: 1223.55, date: Date(), fee: 11.00, recevingCurency: "")
        let trn10 = Transaction(sourceAccount: acounts[0], destinationAccount: acounts[1], amount: 634.566, receiveAmount: 1223.55, date: Date(), fee: 11.00, recevingCurency: "")
        return [trn1,trn2,trn4,trn3,trn5, trn6, trn7, trn8, trn9, trn10,]
    }
    
    func getCurencyExchangeRate() -> [Currency]{
        
        let crr1 = Currency(countryId: 1, currency: "SGD", rate: 1);
        
        let crr2 = Currency(countryId: 2, currency: "INR", rate: 51.10);
        
        let crr3 = Currency(countryId: 3, currency: "LKR", rate: 129.02);
        
        let crr4 = Currency(countryId: 4, currency: "USD", rate: 0.74);
        
        let crr5 = Currency(countryId: 5, currency: "AUD", rate: 1.04);
        
        return [crr1,crr2,crr3,crr4,crr5]
    }
    
}
