//
//  Course.swift
//  CoursesWidgetExtension
//
//  Created by Yazeed AlKhalaf on 11/03/2023.
//

import Foundation
import SwiftUI

struct Course: Identifiable, Hashable {
    let id = UUID()
    
    let color: Color
    let courseCode: String
    let roomName: String
    let startTime: String
    let endTime: String
    
    enum CodingKeys: String, CodingKey {
        case color  = "color"
        case courseCode = "courseCode"
        case roomName = "roomName"
        case startTime = "startTime"
        case endTime = "endTime"
    }
}

extension Course: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let colorString = try values.decode(String.self, forKey: .color)
        color = Color(hex: colorString) ?? .accentColor
        
        courseCode = try values.decode(String.self, forKey: .courseCode)
        roomName = try values.decode(String.self, forKey: .roomName)
        startTime = try values.decode(String.self, forKey: .startTime)
        endTime = try values.decode(String.self, forKey: .endTime)
    }
}
