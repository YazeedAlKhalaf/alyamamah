package dev.alkhalaf.alyamamah.models

import org.json.JSONObject

/// TimeOfDay implementation is mostly from Flutter's TimeOfDay implementation.
/// Original source: https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/material/time.dart
data class TimeOfDay(val hour: Int, val minute: Int): Comparable<TimeOfDay> {
    companion object {
        const val hoursPerDay = 24;
        const val hoursPerPeriod = 12;
        const val minutesPerHour = 60;

        fun fromJson(json: JSONObject): TimeOfDay {
            val hour = json.getInt("hour")
            val minute = json.getInt("minute")

            return TimeOfDay(hour, minute)
        }
    }

    val period: DayPeriod
        get() = if (hour < hoursPerPeriod) DayPeriod.AM else DayPeriod.PM

    val periodHour: Int
        get() {
            var periodHour = this.hour
            if (period == DayPeriod.PM) {
                periodHour -= hoursPerPeriod
            }
            return if (periodHour == 0) 12 else periodHour
        }

    val formattedByPeriod: String
        get() {
            val paddedHour = "%02d".format(periodHour)
            val paddedMinute = "%02d".format(minute)
            return "$paddedHour:$paddedMinute ${period.name}"
        }

    override fun compareTo(other: TimeOfDay): Int {
        return when {
            this.hour != other.hour -> this.hour - other.hour
            else -> this.minute - other.minute
        }
    }
}
