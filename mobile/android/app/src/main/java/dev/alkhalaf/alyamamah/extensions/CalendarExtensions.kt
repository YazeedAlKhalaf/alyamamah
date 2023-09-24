package dev.alkhalaf.alyamamah.extensions

import dev.alkhalaf.alyamamah.models.Day
import java.util.Calendar

fun Calendar.mapWeekdayToDay(): Day {
    return when (this.get(Calendar.DAY_OF_WEEK)) {
        Calendar.SUNDAY -> Day.SUN
        Calendar.MONDAY -> Day.MON
        Calendar.TUESDAY -> Day.TUE
        Calendar.WEDNESDAY -> Day.WED
        Calendar.THURSDAY -> Day.THU
        Calendar.FRIDAY -> Day.FRI
        Calendar.SATURDAY -> Day.SAT
        else -> {
            println("This shouldn't be reached!")
            Day.SUN
        }
    }
}