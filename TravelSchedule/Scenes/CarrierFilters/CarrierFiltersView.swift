//
//  CarrierFiltersView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 18.10.2025.
//

import SwiftUI

struct CarrierFiltersView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = CarrierFiltersViewModel()
    
    let onFinish: (Set<TimeRange>, Bool) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Время отправления")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.ypBlackDynamic)
                
                VStack {
                    ForEach(TimeRange.allCases, id: \.self) { range in
                        TextCheckboxRow(
                            title: range.title,
                            isChecked: viewModel.selectedTimes.contains(range)
                        ) {
                            viewModel.toggleTimeRange(range)
                        }
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Показывать варианты с пересадками")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.ypBlackDynamic)
                
                VStack {
                    TextRadioButtonRow(
                        title: "Да",
                        isSelected: viewModel.showTransfers == true
                    ) {
                        viewModel.setShowTransfers(true)
                    }
                    
                    TextRadioButtonRow(
                        title: "Нет",
                        isSelected: viewModel.showTransfers == false
                    ) {
                        viewModel.setShowTransfers(false)
                    }
                }
            }
            
            Spacer()
        }
        .padding([.top, .horizontal], 16)
        .background(.ypWhiteDynamic)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(.icChevronLeft)
                }
            }
        }
        .overlay(alignment: .bottom) {
            if viewModel.canApply, let showTransfers = viewModel.showTransfers {
                Button {
                    onFinish(viewModel.selectedTimes, showTransfers)
                } label: {
                    Text("Применить")
                        .foregroundColor(.ypWhiteUniversal)
                        .font(.system(size: 17, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(.ypBlueUniversal)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
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
