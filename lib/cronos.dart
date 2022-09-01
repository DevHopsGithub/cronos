library cronos;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Cronos {
  static int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

  static convertBackToFront(time) =>
      DateTime.fromMicrosecondsSinceEpoch(time * 1000);

  static selectedDatetoStringFormat(selectedDate) {
    String data = selectedDate.toString().split(" ")[0];
    var day = data.split("-")[2];
    var month = data.split("-")[1];
    var year = data.split("-")[0];
    return "$day/$month/$year";
  }

  static String stringToDateFormat(String date) {
    var dateFormat = DateFormat('dd/MM/yyyy').parse(date);
    date = DateFormat('yyyy-MM-dd').format(dateFormat);
    return date;
  }

  static String dateFormatToString(String date) {
    var dateFormat = DateFormat('yyyy-MM-dd').parse(date);
    date = DateFormat('dd/MM/yyyy').format(dateFormat);
    return date;
  }

  static int dateTimeToTimestamp(DateTime dateTime) =>
      dateTime.millisecondsSinceEpoch ~/ 1000;

  static DateTime timeStampToDateTime(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  // ignore: non_constant_identifier_names
  static int StringDateToInt(String data) {
    List<String> dataSplit = data.split('/');
    return DateTime.parse('${dataSplit[2]}-${dataSplit[1]}-${dataSplit[0]}')
            .millisecondsSinceEpoch ~/
        1000;
  }

  static formatTimeStamp(int timestamp) {
    List<String> data =
        timeStampToDateTime(timestamp).toString().split(" ")[0].split("-");
    return '${data[2]}/${data[1]}/${data[0]}';
  }

  static formatTimeStampUnderLine(int timestamp) {
    List<String> data =
        timeStampToDateTime(timestamp).toString().split(" ")[0].split("-");
    return '${data[2]} ${data[1]} ${data[0]}';
  }

  // ignore: non_constant_identifier_names
  static timeStampToString_date_and_hour(int timestamp) {
    List<String> data =
        timeStampToDateTime(timestamp).toString().split(" ")[0].split("-");
    return '${data[2]}/${data[1]}/${data[0]} - ${timeStampToStringHour(timestamp)}';
  }

  static hourToDateTime(DateTime dateTime, TimeOfDay time) {
    return DateTime(
        dateTime.year, dateTime.month, dateTime.day, time.hour, time.minute);
  }

  static int hourToTimeStamp(DateTime dateTime, TimeOfDay time) {
    return Cronos.dateTimeToTimestamp(Cronos.hourToDateTime(dateTime, time));
  }

  static timeStampToStringHour(int timestamp) {
    final DateTime dateTime = Cronos.timeStampToDateTime(timestamp);
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  static int dateTimeToAge(DateTime dateTime) {
    int age = DateTime.now().year - dateTime.year;
    if (DateTime.now().month < dateTime.month) {
      age--;
    } else if (DateTime.now().month == dateTime.month &&
        DateTime.now().day < dateTime.day) {
      age--;
    }
    return age;
  }
}
