//
//  Utils.swift
//  CoursesWidgetExtension
//
//  Created by Yazeed AlKhalaf on 22/08/2023.
//

import SwiftUI

struct Utils {
    static func generateMockCourseData(for days: [Day], count: Int = 2) -> [Day: [Course]] {
        var coursesData: [Day: [Course]] = [:]
        
        for day in days {
            var coursesForDay: [Course] = []
            for i in 1...count {
                let color: Color = i % 2 == 0 ? .red : .blue
                let courseCode = "Course \(i)"
                let roomName = i % 2 == 0 ? "F109" : "ONLINE"
                let startTime = TimeOfDay(hour: 9 + i, minute: 30)
                let endTime = TimeOfDay(hour: 10 + i, minute: 20)
                coursesForDay.append(Course(color: color, courseCode: courseCode, roomName: roomName, startTime: startTime, endTime: endTime))
            }
            coursesData[day] = coursesForDay
        }
        return coursesData
    }
}
