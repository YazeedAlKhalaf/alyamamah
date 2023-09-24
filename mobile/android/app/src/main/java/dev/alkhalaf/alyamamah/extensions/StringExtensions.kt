package dev.alkhalaf.alyamamah.extensions

fun String.containsArabicLetters(): Boolean {
    for (character in this) {
        if (character in '\u0600'..'\u06FF') {
            return true
        }
    }
    return false
}