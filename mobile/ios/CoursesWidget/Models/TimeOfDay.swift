//
//  TimeOfDay.swift
//  CoursesWidgetExtension
//
//  Created by Yazeed AlKhalaf on 22/08/2023.
//

import Foundation

enum DayPeriod: String {
    case am
    case pm
}

/// TimeOfDay implementation is mostly from Flutter's TimeOfDay implementation.
/// Original source: https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/material/time.dart
struct TimeOfDay: Hashable {
    static let hoursPerDay = 24
    static let hoursPerPeriod = 12
    static let minutesPerHour = 60
    
    let hour: Int;
    let minute: Int;
    
    var period: DayPeriod {
        return hour < TimeOfDay.hoursPerPeriod ? .am : .pm
    }
    
    var periodHour: Int {
        var periodHour = self.hour
        if (period == .pm) {
            periodHour -= TimeOfDay.hoursPerPeriod
        }
        
        return periodHour == 0 ? 12 : periodHour
    }
    
    var formattedByPeriod: String {
        let paddedHour = String(format: "%02d", periodHour)
        let paddedMinute = String(format: "%02d", minute)
        return "\(paddedHour):\(paddedMinute) \(period)"
    }
    
    enum CodingKeys: String, CodingKey {
        case hour = "hour"
        case minute = "minute"
    }
}

extension TimeOfDay: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        hour = try values.decode(Int.self, forKey: .hour)
        minute = try values.decode(Int.self, forKey: .minute)
    }
}

extension TimeOfDay: Comparable {
    static func < (lhs: TimeOfDay, rhs: TimeOfDay) -> Bool {
        if lhs.hour != rhs.hour {
            return lhs.hour < rhs.hour
        }
        return lhs.minute < rhs.minute
    }
}
