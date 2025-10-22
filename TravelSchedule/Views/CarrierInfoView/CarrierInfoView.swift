//
//  CarrierInfoView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 19.10.2025.
//

import SwiftUI

struct CarrierInfoView: View {
    @Environment(\.dismiss) private var dismiss
    
    let contacts: [Contact] = MockData.contacts
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(.imBrandHorizontal1)
                .resizable()
                .scaledToFit()
                .frame(height: 104)
            
            Text("ОАО «РЖД»")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.ypBlackDynamic)
            
            VStack(alignment: .leading) {
                ForEach(MockData.contacts) { contact in
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

#Preview {
    CarrierInfoView()
}
