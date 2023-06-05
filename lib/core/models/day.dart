enum Day {
  sun,
  mon,
  tue,
  wed,
  thu,
  fri,
  sat;

  String toJson() {
    return toString().split('.').last;
  }

  static Day fromJson(String jsonString) {
    return Day.values
        .firstWhere((v) => v.toString().split('.').last == jsonString);
  }
}
