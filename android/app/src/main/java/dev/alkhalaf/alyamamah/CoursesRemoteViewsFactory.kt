package dev.alkhalaf.alyamamah

import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.widget.RemoteViews
import android.widget.RemoteViewsService

import java.util.Calendar
import org.json.JSONObject
import es.antonborri.home_widget.HomeWidgetPlugin

import dev.alkhalaf.alyamamah.extensions.mapWeekdayToDay
import dev.alkhalaf.alyamamah.models.Course
import dev.alkhalaf.alyamamah.models.Day

class CoursesRemoteViewsFactory(val context: Context, intent: Intent) : RemoteViewsService.RemoteViewsFactory {

    private var dayCoursesMap: MutableMap<Day, Array<Course>> = mutableMapOf()
    private var todayCourses: Array<Course> = arrayOf()

    override fun onCreate() {}

    override fun onDataSetChanged() {
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

        this.dayCoursesMap = dayCoursesMap

        val calendar = Calendar.getInstance()
        val currentDay = calendar.mapWeekdayToDay()

        this.todayCourses = dayCoursesMap[currentDay] ?: arrayOf()
    }

    override fun onDestroy() {}

    override fun getCount(): Int {
        return todayCourses.size
    }

    override fun getViewAt(position: Int): RemoteViews {
        val course = todayCourses[position]

        val rv = RemoteViews(context.packageName, R.layout.course_list_item)
        rv.setTextViewText(R.id.course_room_name, "${course.courseCode} @ ${course.roomName}")
        rv.setTextViewText(R.id.start_end_time, "${course.startTime.formattedByPeriod} - ${course.endTime.formattedByPeriod}")

        // To update the color dynamically.
        val bitmap = Bitmap.createBitmap(20, 20, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)
        val paint = Paint()
        paint.color = course.color
        canvas.drawCircle(10f, 10f, 10f, paint)
        rv.setImageViewBitmap(R.id.color_circle, bitmap)

        return rv
    }

    override fun getLoadingView(): RemoteViews? = null

    override fun getViewTypeCount(): Int = 1

    override fun getItemId(position: Int): Long = position.toLong()

    override fun hasStableIds(): Boolean = true
}