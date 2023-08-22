//
//  DayCourses.swift
//  CoursesWidgetExtension
//
//  Created by Yazeed AlKhalaf on 22/08/2023.
//

import Foundation

struct DayCourses {
    var courses: [Day: [Course]]
}

extension DayCourses: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Day.self)
        var courses = [Day: [Course]]()
        
        for key in container.allKeys {
            let value = try container.decode([Course].self, forKey: key)
            courses[key] = value
        }
        
        self.courses = courses
    }
}
