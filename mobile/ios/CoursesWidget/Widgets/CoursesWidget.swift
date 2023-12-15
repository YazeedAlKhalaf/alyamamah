//
//  CoursesWidget.swift
//  CoursesWidget
//
//  Created by Yazeed AlKhalaf on 11/03/2023.
//

import WidgetKit
import SwiftUI

struct CoursesWidgetEntry: TimelineEntry {
    let date: Date
    let courses: [Day: [Course]]
}

struct CoursesWidgetProvider: TimelineProvider {
    private let widgetRepository = WidgetRepository()
    
    func placeholder(in context: Context) -> CoursesWidgetEntry {
        return CoursesWidgetEntry(
            date: Date(),
            courses: Utils.generateMockCourseData(for: Day.values)
        )
    }
    
    func getSnapshot(in context: Context, completion: @escaping (CoursesWidgetEntry) -> ()) {
        let entry = CoursesWidgetEntry(
            date: Date(),
            courses: Utils.generateMockCourseData(for: Day.values)
        )
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<CoursesWidgetEntry>) -> ()) {
        var entries: [CoursesWidgetEntry] = []
                
        let entry = CoursesWidgetEntry(
            date: Date(),
            courses: widgetRepository.getCoursesWidgetData()
        )
        entries.append(entry)
        
        let timeline = Timeline(entries: entries, policy: .after(Date()))
        completion(timeline)
    }
}

struct CoursesWidgetEntryView : View {
    var entry: CoursesWidgetProvider.Entry
    
    let calendar = Calendar.current
    let day: Day
    
    init(entry: CoursesWidgetProvider.Entry) {
        self.entry = entry
        self.day = calendar.mapWeekdayToDay(from: entry.date)
    }
    
    
    var body: some View {
        HStack(alignment: .top, spacing: 5) {
            VStack {
                Spacer()
                Text(day.rawValue)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(calendar.component(.day, from: entry.date).formatted())
                    .font(.headline)
                Spacer()
            }
            Divider()
            Spacer()
            VStack(spacing: 10) {
                if ((entry.courses[day]?.isEmpty) == true || entry.courses[day] == nil) {
                    Spacer()
                    Text("You have no classes today 😎")
                    Spacer()
                } else {
                    ForEach(entry.courses[day] ?? []) { course in
                        CourseRow(course: course)
                    }
                }
            }
        }
        .padding()
        .widgetBackground(Color.black)
    }
}

struct CoursesWidget: Widget {
    let kind: String = "CoursesWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: CoursesWidgetProvider()
        ) { entry in
            CoursesWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Courses Schedule")
        .description("Always be on top of your courses schedule!")
        .supportedFamilies([.systemMedium, .systemLarge])
        .contentMarginsDisabled()
    }
}

struct CoursesWidget_Previews: PreviewProvider {
    static var previews: some View {
        CoursesWidgetEntryView(
            entry: CoursesWidgetEntry(
                date: Date(),
                courses: Utils.generateMockCourseData(for: Day.values)
            )
        )
        .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
