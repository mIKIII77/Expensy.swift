//
//  TransactionRow.swift
//  Expensy
//
//  Created by Mikhail Karapetyan on 15/10/2023.
//

import SwiftUI
import SwiftUIFontIcon

// A SwiftUI view representing a row for displaying transaction details
struct TransactionRow: View {
    var transaction: Transaction // Transaction object to display
    
    var body: some View {
        HStack(spacing: 20) {
            // Transaction Category Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code:  transaction.icon), fontsize: 24, color: Color.icon)
                }
            
            VStack (alignment: .leading, spacing: 6) {
                // Transaction merchant
                Text(transaction.merchant)
                    .font(.subheadline) // Set font size for the merchant text
                    .bold() // Make the text bold
                    .lineLimit(1) // Limit the number of lines to 1 for merchant text
                
                // Transaction category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7) // Set opacity to make the text slightly transparent
                    .lineLimit(1)
                
                // Transaction Date
                Text(transaction.dateParsed, format: .dateTime.year().month().day()) // Format and display the transaction date
                    .font(.footnote)
                    .foregroundColor(.secondary) // Set text color to secondary color
            }
            
            
            Spacer()
            
            // Transaction amount
            Text(transaction.signedAmount, format: .currency(code: "EUR"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ?
                                 Color.icon : .primary)
            }
        .padding([.top, .bottom], 8) // Add padding to the top and bottom of the row
    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewData)
}
