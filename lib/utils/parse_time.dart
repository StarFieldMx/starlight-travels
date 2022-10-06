String parseTime(int value) {
  String time = "";
  if (value > 60) {
    double hours = value / 60;
    double minutes = hours - hours.toInt();
    hours = hours - minutes;
    minutes = minutes.abs() * 60;
    minutes = minutes.floorToDouble();
    time = "${hours}h ${minutes.toString()}m";
  } else if (value == 60) {
    time = "1hr";
  } else {
    time = value.toString();
  }
  return time;
}
