//
//  CarrierInfoView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 19.10.2025.
//

import SwiftUI

struct CarrierInfoView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = CarrierInfoViewModel()
    
    let carrierCode: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Spacer()
                AsyncImage(url: URL(string: viewModel.carrierLogoUrl ?? "")) { phase in
                    switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 104)
                            
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 104)
                            
                        case .failure:
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 104)
                            
                        @unknown default:
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 104)
                    }
                }
                Spacer()
            }
            
            Text(viewModel.carrierName ?? "")
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
        .task {
            viewModel.loadCarrierInfo(by: carrierCode)
        }
    }
}
