//
//  Extensions.swift
//  Expensy
//
//  Created by Mikhail Karapetyan on 15/10/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let Background = Color("Background") // Declaring static const. for colors of Assets
    static let Icon = Color("Icon")
    static let Text = Color("Text")
    static let systemBackground = Color (uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericEurope: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        return formatter
    }()
    
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericEurope.date(from: self) else { return Date() }
    
        return parsedDate
    }
}
