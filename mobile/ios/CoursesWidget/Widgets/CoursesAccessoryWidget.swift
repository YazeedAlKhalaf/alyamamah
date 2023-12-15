//
//  CoursesAccessoryWidget.swift
//  CoursesWidgetExtension
//
//  Created by Yazeed AlKhalaf on 22/08/2023.
//

import WidgetKit
import SwiftUI

struct CoursesAccessoryWidgetEntry: TimelineEntry {
    let date: Date
    let course: Course?
}

struct CoursesAccessoryWidgetProvider: TimelineProvider {
    private let widgetRepository = WidgetRepository()
    
    func placeholder(in context: Context) -> CoursesAccessoryWidgetEntry {
        let course = Utils.generateMockCourseData(
            for: Day.values
        ).first?.value.first
        return CoursesAccessoryWidgetEntry(
            date: Date(),
            course: course
        )
    }
    
    func getSnapshot(in context: Context, completion: @escaping (CoursesAccessoryWidgetEntry) -> ()) {
        let course = Utils.generateMockCourseData(
            for: Day.values
        ).first?.value.first
        let entry = CoursesAccessoryWidgetEntry(
            date: Date(),
            course: course
        )
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<CoursesAccessoryWidgetEntry>) -> ()) {
        var entries: [CoursesAccessoryWidgetEntry] = []
        
        let coursesForToday = widgetRepository.getCoursesWidgetData()[Calendar.current.mapWeekdayToDay(from: Date())] ?? []
        
        let now = Date()
        let upcomingCourses = coursesForToday.filter { course in
            let courseStartDate = Calendar.current.date(bySettingHour: course.startTime.hour, minute: course.startTime.minute, second: 0, of: now)!
            return courseStartDate > now
        }.sorted(by: { $0.startTime < $1.startTime })
        
        let calendar = Calendar.current
        for course in upcomingCourses {
            let updateTime = calendar.date(bySettingHour: course.startTime.hour, minute: course.startTime.minute, second: 0, of: now)!
            let entry = CoursesAccessoryWidgetEntry(date: updateTime, course: course)
            entries.append(entry)
        }
        
        let nextUpdateDate: Date
        if let lastCourse = entries.last?.course {
            nextUpdateDate = calendar.date(
                bySettingHour: lastCourse.endTime.hour,
                minute: lastCourse.endTime.minute,
                second: 0,
                of: now
            )!
        } else {
            let startOfDay = Calendar.current.startOfDay(for: now)
            nextUpdateDate = calendar.date(
                byAdding: .day,
                value: 1,
                to: startOfDay
            )!
        }
        
        if entries.isEmpty {
            entries.append(CoursesAccessoryWidgetEntry(date: now, course: nil))
        }
        
        let timeline = Timeline(
            entries: entries,
            policy: .after(nextUpdateDate)
        )
        completion(timeline)
    }
}


struct CourseLine: View {
    let course: Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            HStack(spacing: 3) {
                Rectangle()
                    .fill(course.color)
                    .frame(width: 3, height: 30)
                VStack {
                    Text("\(course.courseCode) @ \(course.roomName)")
                        .font(.caption2)
                        .lineLimit(1)
                    Text("\(course.startTime.formattedByPeriod) - \(course.endTime.formattedByPeriod)")
                        .font(.caption2)
                        .lineLimit(1)
                }
            }
        }
    }
}

struct CoursesAccessoryWidgetEntryView: View {
    var entry: CoursesAccessoryWidgetEntry
    
    var body: some View {
        VStack {
            if let course = entry.course {
                CourseLine(course: course)
            } else {
                Text("No Classes 😎")
            }
        }
        .padding(.horizontal, 2)
        .widgetBackground(Color.clear)
    }
}


struct CoursesAccessoryWidget: Widget {
    let kind: String = "CoursesAccessoryWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: CoursesAccessoryWidgetProvider()
        ) { entry in
            CoursesAccessoryWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Courses Schedule")
        .description("Always be on top of your courses schedule!")
        .supportedFamilies([.accessoryRectangular])
        .contentMarginsDisabled()
    }
}

struct CoursesAccessoryWidget_Previews: PreviewProvider {
    static var previews: some View {
        CoursesAccessoryWidgetEntryView(
            entry: CoursesAccessoryWidgetEntry(
                date: Date(),
                course: Course(
                    color: .red,
                    courseCode: "CIS 202",
                    roomName: "F003",
                    startTime: TimeOfDay(hour: 0, minute: 55),
                    endTime: TimeOfDay(hour: 1, minute: 0)
                )
            )
        )
        .previewContext(
            WidgetPreviewContext(
                family: .accessoryRectangular
            )
        )
    }
}
