package dev.alkhalaf.alyamamah.repositories

import android.content.Context
import dev.alkhalaf.alyamamah.models.Course
import dev.alkhalaf.alyamamah.models.Day
import es.antonborri.home_widget.HomeWidgetPlugin
import org.json.JSONObject

class WidgetRepository {
    fun getCoursesWidgetData(context: Context): Map<Day, Array<Course>> {
        val widgetData = HomeWidgetPlugin.getData(context)

        val coursesWidgetDataRaw = widgetData.getString("coursesWidgetData", "{}")
        val coursesWidgetDataMap = JSONObject(coursesWidgetDataRaw)

        val dayCoursesMap: MutableMap<Day, Array<Course>> = mutableMapOf()
        for (day in Day.values()) {
            val coursesArrayJson = coursesWidgetDataMap.optJSONArray(day.abbreviation) ?: continue
            val coursesForDay = Array(coursesArrayJson.length()) { i ->
                Course.fromJson(coursesArrayJson.getJSONObject(i))
            }
            dayCoursesMap[day] = coursesForDay
        }

        return dayCoursesMap
    }
}