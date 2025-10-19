//
//  CarrierFiltersView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 18.10.2025.
//

import SwiftUI

struct CarrierFiltersView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedTimes: Set<TimeRange> = []
    @State private var showTransfers: Bool? = nil
    
    let onFinish: (Set<TimeRange>, Bool) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Время отправления")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.ypBlackUniversal)
                
                VStack {
                    ForEach(TimeRange.allCases, id: \.self) { range in
                        let isRangeAdded = selectedTimes.contains(range)
                        
                        TextCheckboxRow(
                            title: range.title,
                            isChecked: isRangeAdded
                        ) {
                            if isRangeAdded {
                                selectedTimes.remove(range)
                            } else {
                                selectedTimes.insert(range)
                            }
                        }
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Показывать варианты с пересадками")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.ypBlackUniversal)
                
                VStack {
                    TextRadioButtonRow(
                        title: "Да",
                        isSelected: showTransfers == true
                    ) {
                        showTransfers = true
                    }
                    
                    TextRadioButtonRow(
                        title: "Нет",
                        isSelected: showTransfers == false
                    ) {
                        showTransfers = false
                    }
                }
            }
            
            Spacer()
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(.icChevronLeft22Px)
                }
            }
        }
        .overlay(alignment: .bottom) {
            if !selectedTimes.isEmpty, let showTransfers {
                Button() {
                    onFinish(selectedTimes, showTransfers)
                } label: {
                    Text("Применить")
                        .foregroundColor(.ypWhiteUniversal)
                        .font(.system(size: 17, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(.ypBlueUniversal)
                        .cornerRadius(16)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 24)
                }
            }
        }
    }
}

#Preview {
    CarrierFiltersView { _, _ in }
}
