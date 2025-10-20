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
    
    static let contacts: [Contact] = [
        Contact(title: "E-mail", description: "i.lozgkina@yandex.ru"),
        Contact(title: "Телефон", description: "+7 (904) 329-27-71")
    ]
    
    static let practicumText =
    """
    Оферта на оказание 
    образовательных услуг 
    дополнительного 
    образования 
    Яндекс.Практикум
    для физических лиц
    """
    
    static let descriptionText =
    """
    Данный документ является действующим, если расположен по адресу: https://
    yandex.ru/legal/practicum_offer
    
    Российская Федерация, город Москва
    """
    
    static let terminologyText =
"""
Понятия, используемые в Оферте, означают следующее:  Авторизованные адреса — адреса электронной почты каждой Стороны. Авторизованным адресом Исполнителя является адрес электронной почты, указанный в разделе 11 Оферты. Авторизованным адресом Студента является адрес электронной почты, указанный Студентом в Личном кабинете.  Вводный курс — начальный Курс обучения по представленным на Сервисе Программам обучения в рамках выбранной Студентом Профессии или Курсу, рассчитанный на определенное количество часов самостоятельного обучения, который предоставляется Студенту единожды при регистрации на Сервисе на безвозмездной основе. В процессе обучения в рамках Вводного курса Студенту предоставляется возможность ознакомления с работой Сервиса и определения возможности Студента продолжить обучение в рамках Полного курса по выбранной Студентом Программе обучения. Точное количество часов обучения в рамках Вводного курса зависит от выбранной Студентом Профессии или Курса и определяется в Программе обучения, размещенной на Сервисе. Максимальный срок освоения Вводного курса составляет 1 (один) год с даты начала обучения.
"""
}
