package dev.alkhalaf.alyamamah.models

enum class Day(val abbreviation: String) {
    SUN("sun"),
    MON("mon"),
    TUE("tue"),
    WED("wed"),
    THU("thu"),
    FRI("fri"),
    SAT("sat");

    companion object {
        fun fromAbbreviation(abbreviation: String): Day? {
            return values().firstOrNull { it.abbreviation == abbreviation }
        }
    }
}