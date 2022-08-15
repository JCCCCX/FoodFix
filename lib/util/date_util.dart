import 'package:intl/intl.dart';

String currentDateYmd() {
  var date = DateTime.now();
  String ymd =
      "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  return ymd;
}

String currentTimeYmdhms() {
  var date = DateTime.now();
  String ymd =
      "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  String hms =
      "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}";
  return "$ymd $hms";
}

String readTimestamp(int? timestamp) {
  if (timestamp == null) return '';

  var millis = timestamp;
  var dt = DateTime.fromMillisecondsSinceEpoch(millis);

  return DateFormat('yyyy-MM-dd HH:mm:ss').format(dt);
}
