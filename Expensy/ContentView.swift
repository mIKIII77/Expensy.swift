//
//  ContentView.swift
//  Expensy
//
//  Created by Mikhail Karapetyan on 12/10/2023.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    // var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var body: some View {
        // Setting up a navigation view
        NavigationView {
            // Creating a scrollable view
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // Chart
                    
                    let data = transactionListVM.accumulateTransactions()
                    
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading) { // Leading alignment to display the amount correctly in the top left corner, instead of the middle, when using the chart."
                                    ChartLabel(totalExpenses.formatted(.currency(code: "EUR")), type: .title, format: "€%.02f")
                                LineChart()
                            }
                            .background(Color.systemBackground) //Fix background color of chart
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground,
                                    foregroundColor: ColorGradient(Color.Icon.opacity(0.4), Color.Icon)))
                        .frame(height: 300)
                        
                    }
                    
                  
                    // Recent Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity) // Make the whole screen scrollable
            }
            .background(Color.Background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette) // Using palette rendering mode for color adaptation
                        .foregroundStyle(Color.Icon, .primary) // (First color "Notification mark", Second color "bell")
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary) // Navigation buttons color (ex: back)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        ContentView()
            .environmentObject(transactionListVM)
    }
}

