//
//  SearchBar.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 16.10.2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var prompt: String = "Search"
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField(prompt, text: $text)
                .tint(.ypBlueUniversal)
                .focused($isFocused)
                .textFieldStyle(.plain)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(.vertical, 8)
            
            if !text.isEmpty {
                Button {
                    text = ""
                    isFocused = true
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
        .animation(.default, value: text)
    }
}
