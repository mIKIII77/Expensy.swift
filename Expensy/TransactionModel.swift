//
//  TransactionModel.swift
//  Expensy
//
//  Created by Mikhail Karapetyan on 15/10/2023.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable { // Indetifiable mean every Transaction is unique with unique ID
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
    
    var icon: FontAwesomeCode {
        if let category = Category.all.first(where: { $0.id == categoryId }) {
            return category.icon
        }
        
        return .question
    }
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount // If transactionType == credit, return amount, if not return -amount
    }
    
    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}

enum TransactionType: String {
    case debit = "Debit"
    case credit = "Credit"
}
 
struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
}

extension Category {
    static let computers = Category(id: 1, name: "Computers", icon: .laptop)
    static let clothing = Category(id: 2, name: "Clothing", icon: .tshirt)
    static let kids = Category(id: 3, name: "Kids", icon: .paper_plane)
    static let baby = Category(id: 4, name: "Baby", icon: .paper_plane)
    static let books = Category(id: 5, name: "Books", icon: .book)
    static let automotive = Category(id: 6, name: "Automotive", icon: .car)
    static let industrial = Category(id: 7, name: "Industrial", icon: .industry)
    // Other categorys to do: Sports, Health, Movies, Music, Electronics, Outdoors
    
    static let electronics = Category(id: 13, name: "Electronics", icon: .node, mainCategoryId: 1)
}


extension Category {
    static let categories: [Category] = [
        .computers,
        .clothing,
        .kids,
        .baby,
        .books,
        .automotive,
        .industrial
    ]
    
    static let subCategories: [Category] = [
        .electronics
    ]
    
    static let all: [Category] = categories + subCategories
}
