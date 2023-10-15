//
//  ContentView.swift
//  Expensy
//
//  Created by Mikhail Karapetyan on 12/10/2023.
//

import SwiftUI

struct ContentView: View {
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
    }
}

#Preview {
    ContentView()
} 
