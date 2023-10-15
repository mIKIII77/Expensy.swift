//
//  TransactionModel.swift
//  Expensy
//
//  Created by Mikhail Karapetyan on 15/10/2023.
//

import Foundation

struct Transaction: Identifiable { // Indetifiable mean every Transaction is unique with unique ID
    let id: Int 
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount // If transactionType == credit, return amount, if not return -amount
    }
}

enum TransactionType: String {
    case debit = "Debit"
    case credit = "Credit"
}
