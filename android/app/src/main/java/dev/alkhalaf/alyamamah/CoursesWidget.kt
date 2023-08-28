package dev.alkhalaf.alyamamah

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import dev.alkhalaf.alyamamah.extensions.mapWeekdayToDay
import dev.alkhalaf.alyamamah.repositories.WidgetRepository
import java.util.Calendar

class CoursesWidget : AppWidgetProvider() {
    private val widgetRepository = WidgetRepository()

    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    private fun updateAppWidget(context: Context, appWidgetManager: AppWidgetManager, appWidgetId: Int) {
        val dayCoursesMap = widgetRepository.getCoursesWidgetData(context)

        val calendar = Calendar.getInstance()
        val currentDay = calendar.mapWeekdayToDay()

        val views = if (dayCoursesMap[currentDay]?.isEmpty() == true) {
            RemoteViews(context.packageName, R.layout.courses_widget_empty)
        } else {
            val intent = Intent(context, CoursesWidgetService::class.java)
            RemoteViews(context.packageName, R.layout.courses_widget).apply {
                setRemoteAdapter(R.id.list_view, intent)
            }
        }

        appWidgetManager.updateAppWidget(appWidgetId, views)
        appWidgetManager.notifyAppWidgetViewDataChanged(appWidgetId, R.id.list_view)
    }
}
