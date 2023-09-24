//
//  CalendarExtensions.swift
//  CoursesWidgetExtension
//
//  Created by Yazeed AlKhalaf on 22/08/2023.
//

import Foundation

extension Calendar {
    func mapWeekdayToDay(from date: Date) -> Day {
        let weekdayIndex = (self.component(.weekday, from: date)) - 1
        let weekdaySymbol = self.weekdaySymbols[weekdayIndex]
        
        var day: Day
        switch weekdaySymbol {
        case "Sunday":
            day = .sun
        case "Monday":
            day = .mon
        case "Tuesday":
            day = .tue
        case "Wednesday":
            day = .wed
        case "Thursday":
            day = .thu
        case "Friday":
            day = .fri
        case "Saturday":
            day = .sat
        default:
            print("lol this was reached and it shouldn't be reached!")
            day = .sun
        }
        
        return day
    }
}
