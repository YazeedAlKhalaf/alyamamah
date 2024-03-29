package dev.alkhalaf.alyamamah

import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.view.View
import android.widget.RemoteViews
import android.widget.RemoteViewsService
import dev.alkhalaf.alyamamah.extensions.containsArabicLetters

import java.util.Calendar

import dev.alkhalaf.alyamamah.extensions.mapWeekdayToDay
import dev.alkhalaf.alyamamah.models.Course
import dev.alkhalaf.alyamamah.models.Day
import dev.alkhalaf.alyamamah.repositories.WidgetRepository

class CoursesRemoteViewsFactory(private val context: Context, intent: Intent) : RemoteViewsService.RemoteViewsFactory {
    private val widgetRepository = WidgetRepository()

    private var dayCoursesMap: MutableMap<Day, Array<Course>> = mutableMapOf()
    private var todayCourses: Array<Course> = arrayOf()

    override fun onCreate() {}

    override fun onDataSetChanged() {
        dayCoursesMap = widgetRepository.getCoursesWidgetData(context).toMutableMap()

        val calendar = Calendar.getInstance()
        val currentDay = calendar.mapWeekdayToDay()

        todayCourses = dayCoursesMap[currentDay] ?: arrayOf()
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

        // Set the layout direction based on the presence of Arabic letters
        if (course.courseCode.containsArabicLetters()) {
            rv.setInt(R.id.course_list_item_root, "setLayoutDirection", View.LAYOUT_DIRECTION_RTL)
        } else {
            rv.setInt(R.id.course_list_item_root, "setLayoutDirection", View.LAYOUT_DIRECTION_LTR)
        }

        return rv
    }

    override fun getLoadingView(): RemoteViews? = null

    override fun getViewTypeCount(): Int = 1

    override fun getItemId(position: Int): Long = position.toLong()

    override fun hasStableIds(): Boolean = true
}