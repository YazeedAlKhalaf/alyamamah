//
//  WidgetRepository.swift
//  CoursesWidgetExtension
//
//  Created by Yazeed AlKhalaf on 22/08/2023.
//

import Foundation

struct WidgetRepository {
    let sharedDefaults = UserDefaults(
        suiteName: "group.dev.alkhalaf.alyamamah.shared"
    )
    
    func getCoursesWidgetData() -> [Day: [Course]] {
        guard let coursesWidgetData = sharedDefaults?.string(
            forKey: "coursesWidgetData"
        ), let coursesData = coursesWidgetData.data(using: .utf8) else {
            return [:]
        }
        
        do {
            let decoder = JSONDecoder()
            let dayCourses = try decoder.decode(DayCourses.self, from: coursesData)
            return dayCourses.courses
        } catch {
            print("failed to decode courses from shared storage.")
            return [:]
        }
    }
}
