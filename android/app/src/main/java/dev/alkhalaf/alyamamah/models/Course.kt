package dev.alkhalaf.alyamamah.models

import java.util.UUID
import android.graphics.Color
import org.json.JSONObject

data class Course(
        val id: String = UUID.randomUUID().toString(),
        val color: Int,
        val courseCode: String,
        val roomName: String,
        val startTime: TimeOfDay,
        val endTime: TimeOfDay
) {
    companion object {
        fun fromJson(json: JSONObject): Course {
            val color = Color.parseColor(json.getString("color"))
            val courseCode = json.getString("courseCode")
            val roomName = json.getString("roomName")
            val startTime = TimeOfDay.fromJson(json.getJSONObject("startTime"))
            val endTime = TimeOfDay.fromJson(json.getJSONObject("endTime"))

            return Course(
                    color = color,
                    courseCode = courseCode,
                    roomName = roomName,
                    startTime = startTime,
                    endTime = endTime
            )
        }
    }
}
