//
//  MockData.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import Foundation

enum MockData {
    static let carriers: [Carrier] = [
        Carrier(
            title: "РЖД",
            date: "14 января",
            fromTime: "22:30",
            toTime: "8:30",
            hasTransfer: false
        ),
        Carrier(
            title: "РЖД",
            date: "14 января",
            fromTime: "22:30",
            toTime: "8:30",
            hasTransfer: true
        ),
        Carrier(
            title: "РЖД",
            date: "14 января",
            fromTime: "22:30",
            toTime: "8:30",
            hasTransfer: false
        ),
        Carrier(
            title: "РЖД",
            date: "14 января",
            fromTime: "22:30",
            toTime: "8:30",
            hasTransfer: true
        ),
        Carrier(
            title: "РЖД",
            date: "14 января",
            fromTime: "22:30",
            toTime: "8:30",
            hasTransfer: true
        ),
        Carrier(
            title: "РЖД",
            date: "14 января",
            fromTime: "22:30",
            toTime: "8:30",
            hasTransfer: false
        )
    ]
    
    static let storyCarouselItems: [StoryCarouselItem] = [
        StoryCarouselItem(
            title: "Text Text Text Text Text Text Text Text Text",
            imageResource: .imStoryBackground1,
            isWatched: true
        ),
        StoryCarouselItem(
            title: "Text Text Text Text Text Text Text Text Text",
            imageResource: .imStoryBackground1,
            isWatched: false
        ),
        StoryCarouselItem(
            title: "Text Text Text Text Text Text Text Text Text",
            imageResource: .imStoryBackground1,
            isWatched: true
        ),
        StoryCarouselItem(
            title: "Text Text Text Text Text Text Text Text Text",
            imageResource: .imStoryBackground1,
            isWatched: false
        ),
        StoryCarouselItem(
            title: "Text Text Text Text Text Text Text Text Text",
            imageResource: .imStoryBackground1,
            isWatched: true
        ),
        StoryCarouselItem(
            title: "Text Text Text Text Text Text Text Text Text",
            imageResource: .imStoryBackground1,
            isWatched: false
        ),
        StoryCarouselItem(
            title: "Text Text Text Text Text Text Text Text Text",
            imageResource: .imStoryBackground1,
            isWatched: true
        ),
        StoryCarouselItem(
            title: "Text Text Text Text Text Text Text Text Text",
            imageResource: .imStoryBackground1,
            isWatched: false
        )
    ]
}
