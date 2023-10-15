//
//  TransactionListViewModel.swift
//  Expensy
//
//  Created by Mikhail Karapetyan on 15/10/2023.
//

import Foundation

final class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
}
