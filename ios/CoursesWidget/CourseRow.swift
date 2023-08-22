//
//  CourseRow.swift
//  CoursesWidgetExtension
//
//  Created by Yazeed AlKhalaf on 11/03/2023.
//

import SwiftUI

struct CourseRow: View {
    private let course: Course;
    
    init(course: Course) {
        self.course = course
    }
    
    var body: some View {
        HStack {
            Circle()
                .fill(course.color)
                .frame(width: 15, height: 15)
            Text("\(course.courseCode) @ \(course.roomName)")
                .font(.caption)
                .bold()
            Spacer()
            Text("\(course.startTime) - \(course.endTime)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        
    }
}
