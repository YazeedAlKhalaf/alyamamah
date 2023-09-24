package dev.alkhalaf.alyamamah

import android.content.Intent
import android.widget.RemoteViewsService

class CoursesWidgetService : RemoteViewsService() {
    override fun onGetViewFactory(intent: Intent): RemoteViewsFactory {
        return CoursesRemoteViewsFactory(this.applicationContext, intent)
    }
}