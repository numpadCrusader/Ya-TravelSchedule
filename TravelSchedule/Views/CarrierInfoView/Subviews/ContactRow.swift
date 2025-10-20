//
//  ContactRow.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct ContactRow: View {
    let contact: Contact
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(contact.title)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.ypBlackDynamic)
            
            Text(contact.description)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.ypBlueUniversal)
        }
        .frame(height: 60)
    }
}

#Preview {
    ContactRow(
        contact: Contact(
            title: "E-mail",
            description: "i.lozgkina@yandex.ru"
        )
    )
}
