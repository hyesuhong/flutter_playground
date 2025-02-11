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

const compactDecimal = [
  {"value": 1, "suffix": ""},
  {"value": 1e3, "suffix": "K"},
  {"value": 1e6, "suffix": "M"},
];

String formatCompactNumber(int num) {
  var targetCompactor = compactDecimal
      .lastWhere((compactor) => num >= (compactor["value"] as double));

  double compactorValue = targetCompactor["value"] as double;
  String compactorSuffix = targetCompactor["suffix"] as String;

  String convertedNumToStr =
      (num / compactorValue).toStringAsFixed(1) + compactorSuffix;

  return convertedNumToStr;
}
