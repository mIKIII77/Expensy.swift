//
//  ExpensyApp.swift
//  Expensy
//
//  Created by Mikhail Karapetyan on 12/10/2023.
//

import SwiftUI

@main
struct ExpensyApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
