String formatDate(DateTime date) {
  int year = date.year;
  int month = date.month;
  int day = date.day;

  return "$year-${addZero(month)}-${addZero(day)}";
}

String addZero(int num) {
  var numToStr = num.toString();

  return numToStr.padLeft(2, "0");
}
