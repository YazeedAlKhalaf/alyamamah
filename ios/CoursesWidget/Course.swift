//
//  Course.swift
//  CoursesWidgetExtension
//
//  Created by Yazeed AlKhalaf on 11/03/2023.
//

import Foundation

struct Course: Identifiable, Decodable, Hashable {
    let id = UUID()
    
    let courseCode: String
    let roomName: String
    let startTime: String
    let endTime: String
}
