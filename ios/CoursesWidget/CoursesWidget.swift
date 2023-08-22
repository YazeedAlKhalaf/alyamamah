//
//  CoursesWidget.swift
//  CoursesWidget
//
//  Created by Yazeed AlKhalaf on 11/03/2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> CoursesEntry {
        let coursesList = [
            Course(
                color: .blue,
                courseCode: "PHL 101",
                roomName: "F109",
                startTime: TimeOfDay(hour: 9, minute: 30),
                endTime: TimeOfDay(hour: 10, minute: 20)
            ),
            Course(
                color: .red,
                courseCode: "ARB 101",
                roomName: "ONLINE",
                startTime: TimeOfDay(hour: 10, minute: 30),
                endTime: TimeOfDay(hour: 11, minute: 20)
            )
        ]
        
        return CoursesEntry(
            date: Date(),
            courses: [
                "sun": coursesList,
                "mon": coursesList,
                "tue": coursesList,
                "wed": coursesList,
                "thu": coursesList,
            ]
        )
    }
    
    func getSnapshot(in context: Context, completion: @escaping (CoursesEntry) -> ()) {
        let coursesList = [
            Course(
                color: .red,
                courseCode: "PHL 101",
                roomName: "F109",
                startTime: TimeOfDay(hour: 9, minute: 30),
                endTime: TimeOfDay(hour: 10, minute: 20)
            ),
            Course(
                color: .blue,
                courseCode: "ARB 101",
                roomName: "ONLINE",
                startTime: TimeOfDay(hour: 10, minute: 30),
                endTime: TimeOfDay(hour: 11, minute: 20)
            ),
        ]
        let entry = CoursesEntry(
            date: Date(),
            courses: [
                "sun": coursesList,
                "mon": coursesList,
                "tue": coursesList,
                "wed": coursesList,
                "thu": coursesList,
            ]
        )
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [CoursesEntry] = []
        var courses: [String: [Course]] = [String: [Course]]()
        
        let sharedDefaults = UserDefaults.init(
            suiteName: "group.dev.alkhalaf.alyamamah.shared"
        )
        if (sharedDefaults != nil) {
            do {
                let coursesWidgetData = sharedDefaults?.string(
                    forKey: "coursesWidgetData"
                )
                if (coursesWidgetData != nil) {
                    let decoder = JSONDecoder()
                    
                    let coursesData = coursesWidgetData?.data(using: .utf8)
                    
                    courses = try decoder.decode(
                        [String: [Course]].self,
                        from: coursesData!
                    )
                    print("decoded the courses successfully: \(courses)")
                }
            } catch {
                print("failed to decode courses from shared storage.")
            }
        }
        
        let entry = CoursesEntry(date: Date(), courses: courses)
        entries.append(entry)
        
        let timeline = Timeline(entries: entries, policy: .after(Date()))
        completion(timeline)
    }
}



struct CoursesEntry: TimelineEntry {
    let date: Date
    let courses: [String: [Course]]
}

struct CoursesWidgetEntryView : View {
    var entry: Provider.Entry
    
    let calendar = Calendar.current
    let day: String
    
    init(entry: Provider.Entry) {
        self.entry = entry
        
        let weekday = calendar.weekdaySymbols[(calendar.component(.weekday, from: entry.date))-1]
        
        print("initializing stuff: \(weekday)")
        switch weekday {
        case "Sunday":
            day = "sun"
        case "Monday":
            day = "mon"
        case "Tuesday":
            day = "tue"
        case "Wednesday":
            day = "wed"
        case "Thursday":
            day = "thu"
        case "Friday":
            day = "fri"
        case "Saturday":
            day = "sat"
        default:
            print("lol this was reached and it shouldn't be reached!")
            day = "sun"
        }
        
    }
    
    
    var body: some View {
        HStack(alignment: .top, spacing: 5) {
            VStack {
                Spacer()
                Text(day)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(calendar.component(.day, from: entry.date).formatted())
                    .font(.headline)
                Spacer()
            }
            Divider()
            Spacer()
            VStack(spacing: 10) {
                if ((entry.courses[day]?.isEmpty) == nil) {
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
    }
}

struct CoursesWidget: Widget {
    let kind: String = "CoursesWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CoursesWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Courses Schedule")
        .description("Always be on top of your courses schedule!")
        .supportedFamilies([.systemMedium])
    }
}

struct CoursesWidget_Previews: PreviewProvider {
    static var previews: some View {
        CoursesWidgetEntryView(
            entry: CoursesEntry(
                date: Date(),
                courses: [
                    "sun": [
                        Course(
                            color: .red,
                            courseCode: "PHL 101",
                            roomName: "F109",
                            startTime: TimeOfDay(hour: 9, minute: 30),
                            endTime: TimeOfDay(hour: 10, minute: 20)
                        ),
                        Course(
                            color: .blue,
                            courseCode: "ARB 101",
                            roomName: "ONLINE",
                            startTime: TimeOfDay(hour: 9, minute: 30),
                            endTime: TimeOfDay(hour: 10, minute: 20)
                        ),
                        Course(
                            color: .red,
                            courseCode: "ARB 101",
                            roomName: "ONLINE",
                            startTime: TimeOfDay(hour: 9, minute: 30),
                            endTime: TimeOfDay(hour: 10, minute: 20)
                        ),
                        Course(
                            color: .blue,
                            courseCode: "ARB 101",
                            roomName: "ONLINE",
                            startTime: TimeOfDay(hour: 9, minute: 30),
                            endTime: TimeOfDay(hour: 10, minute: 20)
                        ),
                        Course(
                            color: .red,
                            courseCode: "ARB 101",
                            roomName: "ONLINE",
                            startTime: TimeOfDay(hour: 9, minute: 30),
                            endTime: TimeOfDay(hour: 10, minute: 20)
                        ),
                        Course(
                            color: .blue,
                            courseCode: "ARB 101",
                            roomName: "ONLINE",
                            startTime: TimeOfDay(hour: 9, minute: 30),
                            endTime: TimeOfDay(hour: 10, minute: 20)
                        )
                    ]
                ]
            )
        )
        .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
