//
//  PreviewData.swift
//  Expensy
//
//  Created by Mikhail Karapetyan on 15/10/2023.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "01/07/2023", institution: "Cora", account: "Master Card - AE", merchant: "Apple", amount: 10.49, type: "Debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: true)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
