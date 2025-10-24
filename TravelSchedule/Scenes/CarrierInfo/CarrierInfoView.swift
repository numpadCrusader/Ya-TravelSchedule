//
//  CarrierInfoView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 19.10.2025.
//

import SwiftUI

struct CarrierInfoView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: CarrierInfoViewModel
    
    let carrier: Carrier
    
    init(carrier: Carrier) {
        self.carrier = carrier
        _viewModel = StateObject(
            wrappedValue: CarrierInfoViewModel(
                carrierName: carrier.title,
                contacts: [
                    .init(title: "E-mail", description: "Test"),
                    .init(title: "Телефон", description: "Test")
                ]
            )
        )
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(.imBrandHorizontal1)
                .resizable()
                .scaledToFit()
                .frame(height: 104)
            
            Text(viewModel.carrierName)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.ypBlackDynamic)
            
            VStack(alignment: .leading) {
                ForEach(viewModel.contacts) { contact in
                    ContactRow(contact: contact)
                }
            }
            
            Spacer()
        }
        .padding([.top, .horizontal], 16)
        .frame(maxWidth: .infinity)
        .background(.ypWhiteDynamic)
        .navigationTitle("Информация о перевозчике")
        .navigationBarTitleDisplayMode(.inline)
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
    }
}
