//
//  DayEnum.swift
//  CoursesWidgetExtension
//
//  Created by Yazeed AlKhalaf on 11/03/2023.
//

import Foundation

enum Day: String, Decodable, CodingKey {
    case sun = "sun"
    case mon = "mon"
    case tue = "tue"
    case wed = "wed"
    case thu = "thu"
    case fri = "fri"
    case sat = "sat"
    
    static let values: [Day] = [.sun, .mon, .tue, .wed, .thu]
    static let allValues: [Day] = [.sun, .mon, .tue, .wed, .thu, .fri, .sat]
}
