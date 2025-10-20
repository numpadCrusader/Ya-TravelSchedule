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
            Image(.icSearch)
                .foregroundColor(text.isEmpty ? .ypGrayUniversal : .ypBlackDynamic)
            
            TextField(
                "",
                text: $text,
                prompt: Text(prompt).foregroundStyle(.ypGrayUniversal)
            )
            .foregroundColor(.ypBlackDynamic)
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
                    Image(.icClear)
                        .foregroundColor(.ypGrayUniversal)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 10)
        .background(.searchBarGray)
        .cornerRadius(10)
        .padding(.horizontal)
        .animation(.default, value: text)
    }
}
