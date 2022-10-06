String parseTime(int value) {
  String time = "";
  if (value >= 60) {
    final hours = value / 60;
    double minutes = hours - hours.round();
    minutes * 60;
    minutes.floor();
    time = "${hours}h ${minutes.toString()}m";
  } else {
    time = value.toString();
  }
  return time;
}
