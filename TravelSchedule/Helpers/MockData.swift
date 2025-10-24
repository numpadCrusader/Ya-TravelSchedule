//
//  MockData.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import Foundation

enum MockData {
    static let cities: [City] = [
        City(
            title: "Актау",
            stations: [
                .init(title: "Вокзал Мангистау", code: "S9619344")
            ]
        ),
        City(
            title: "Алматы",
            stations: [
                .init(title: "Вокзал Алматы-1", code: "S9618978"),
                .init(title: "Вокзал Алматы-2", code: "S9618977")
            ]
        ),
        City(
            title: "Астана",
            stations: [
                .init(title: "Вокзал Нурлы Жол", code: "S9863459"),
                .init(title: "Вокзал Нур-Султан", code: "S9619762")
            ]
        ),
        City(
            title: "Атырау",
            stations: [
                .init(title: "Вокзал Атырау", code: "S9619367")
            ]
        ),
        City(
            title: "Караганды",
            stations: [
                .init(title: "Вокзал Караганды-Пасс", code: "S9619954")
            ]
        ),
        City(
            title: "Павлодар",
            stations: [
                .init(title: "Вокзал Павлодар", code: "S9619906")
            ]
        ),
        City(
            title: "Тараз",
            stations: [
                .init(title: "Вокзал Тараз", code: "9619123")
            ]
        ),
        City(
            title: "Усть-Каменогорск",
            stations: [
                .init(title: "Вокзал Оскемен-1", code: "S9619142"),
                .init(title: "Вокзал Усть-Каменогорск", code: "S9619282")
            ]
        ),
        City(
            title: "Шымкент",
            stations: [
                .init(title: "Вокзал Шымкент", code: "S9619176")
            ]
        )
    ]
    
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
    
    static let stories: [Story] = [
        Story(
            id: 0,
            title: "Text Text Text Text Text Text Text Text Text Text",
            description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            imageResource: .imStoryBackground1,
            isWatched: true
        ),
        Story(
            id: 1,
            title: "Text Text Text Text Text Text Text Text Text Text",
            description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            imageResource: .imStoryBackground2,
            isWatched: false
        ),
        Story(
            id: 2,
            title: "Text Text Text Text Text Text Text Text Text Text",
            description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            imageResource: .imStoryBackground3,
            isWatched: false
        ),
        Story(
            id: 3,
            title: "Text Text Text Text Text Text Text Text Text Text",
            description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
            imageResource: .imStoryBackground4,
            isWatched: true
        ),
        Story(
            id: 4,
            title: "Text Text Text Text Text Text Text Text Text Text",
            description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
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
