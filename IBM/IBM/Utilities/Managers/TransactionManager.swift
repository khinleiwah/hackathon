//
//  TransactionManager.swift
//  IBM
//
//  Created by Kasun Ranasinghe on 4/6/19.
//  Copyright © 2019 Win. All rights reserved.
//

import UIKit



class TransactionManager: NSObject {
    
    override init() {
        
    }

    // calulate the transaction
    func calculateTransaction(sourceAccount:Account,desticationAccount:Account,Amount:Double) -> Transaction {
        let datesource = DataSource()
        let currencies = datesource.getCurencyExchangeRate()
        let forignCurencies = currencies.filter {
            $0.countryId == desticationAccount.countryId
        }
        var receivingCurency = Currency()
        if(forignCurencies.count > 0){
            receivingCurency = forignCurencies[0]
        }else{
            // this part to handle later
            receivingCurency.rate = 1
            receivingCurency.currency = "SGD"
        }
        let sourceAccountCountryId = sourceAccount.countryId;
        let desticationAccountCountryId = desticationAccount.countryId;
        
        if (sourceAccountCountryId == desticationAccountCountryId || desticationAccount.isIBankRemitanceAvailable) {

            let transaction = Transaction(sourceAccount: sourceAccount, destinationAccount: desticationAccount, amount: Amount, receiveAmount: Amount,date:Date(),fee:0, recevingCurency: receivingCurency.currency,transactionRate:receivingCurency.rate);

            return transaction;
        }else{
           
            
            let recieveAmount = Amount * receivingCurency.rate
            
            let fee = recieveAmount*0.01
            

            let transaction = Transaction(sourceAccount: sourceAccount, destinationAccount: desticationAccount, amount: Amount, receiveAmount: recieveAmount,date:Date(),fee:fee, recevingCurency: receivingCurency.currency,transactionRate:receivingCurency.rate);

            return transaction;
        }
        

    }
    
    // verify that transactions can be done
    func validateTransaction(sourceAccount:Account,destinationAccount:Account,Amount:Double) ->  (status:Bool,error:String){
        
       if(sourceAccount.ballance < Amount){
            return (true,"Your ballance is not enough for this transaction")
       }else{
            return (true,"Proceed")
       }
    }
}
