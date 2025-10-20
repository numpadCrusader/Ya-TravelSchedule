//
//  Story.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct Story: Identifiable {
    let id = UUID()
    let backgroundColor: ImageResource
    let title: String
    let description: String
    
    static let story1 = Story(
        backgroundColor: .imStoryBackground1,
        title: "Text Text Text Text Text Text Text Text Text Text",
        description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"
    )
    
    static let story2 = Story(
        backgroundColor: .imStoryBackground2,
        title: "Text Text Text Text Text Text Text Text Text Text",
        description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"
    )
    
    static let story3 = Story(
        backgroundColor: .imStoryBackground3,
        title: "Text Text Text Text Text Text Text Text Text Text",
        description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"
    )
    
    static let story4 = Story(
        backgroundColor: .imStoryBackground4,
        title: "Text Text Text Text Text Text Text Text Text Text",
        description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"
    )
}
