//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct StoryView: View {
    let story: Story
    
    var body: some View {
        Image(story.imageResource)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .padding(.top, 7)
            .padding(.bottom, 17)
            .overlay {
                VStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text(story.title)
                            .font(.system(size: 34, weight: .bold))
                            .lineLimit(2)
                            .truncationMode(.tail)
                            .foregroundColor(.ypWhiteUniversal)
                        
                        Text(story.description)
                            .font(.system(size: 20, weight: .regular))
                            .lineLimit(3)
                            .truncationMode(.tail)
                            .foregroundColor(.ypWhiteUniversal)
                    }
                    .padding(.init(top: 0, leading: 16, bottom: 40, trailing: 16))
                }
            }
        
    }
}
