import 'package:intl/intl.dart';
import 'package:date_calc/date_calc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:volare_radiotalk/common/helper/locale_helper.dart';

class DateHelper {
  const DateHelper._();

  static String formatDate(
    DateTime date, {
    String local = 'ja_JP',
  }) =>
      DateHelper.format(
        date,
        format: LocaleHelper.isJapanese() ? 'yyyy.MM.dd (E)' : 'MM.dd yyyy (E)',
        local: local,
        isJapanese: LocaleHelper.isJapanese(),
      );

  static String formatYYYYMMddHHmm(
    DateTime date, {
    bool dayOfWeek = false,
  }) =>
      DateHelper.format(date, dayOfWeek: dayOfWeek, second: false);

  static String format(
    DateTime date, {
    String format,
    String local = 'ja_JP',
    bool isJapanese = true,
    bool year = true,
    bool month = true,
    bool day = true,
    bool dayOfWeek = true,
    bool hour = true,
    bool minute = true,
    bool second = true,
  }) {
    var f = '';
    if (format != null && format.isNotEmpty) {
      f = format;
    } else {
      if (year) {
        f += 'yyyy';
      }
      if (month) {
        f += '/MM';
      }
      if (day) {
        f += '/dd';
      }
      if (dayOfWeek) {
        f += '(E)';
      }
      if (hour) {
        f += ' HH';
      }
      if (minute) {
        f += ':mm';
      }
      if (second) {
        f += ':ss';
      }
    }
    initializeDateFormatting(local);
    final formatter = DateFormat(f, local);
    return formatter.format(date);
  }

  static DateTime milliToDate(int millisecondsSinceEpoch) {
    return DateTime.fromMicrosecondsSinceEpoch(millisecondsSinceEpoch * 1000);
  }

  static String dateToString(DateTime date, String format) {
    return DateFormat(format).format(date);
  }

  static String milliToString(int millisecondsSinceEpoch, String format) {
    return DateFormat(format)
        .format(DateHelper.milliToDate(millisecondsSinceEpoch));
  }

  static DateTime date(
      {int year,
      int month,
      int day,
      int hour = 0,
      int minute = 0,
      int second = 0}) {
    final date = DateTime(year, month, day, hour, minute, second);
    return date.add(date.timeZoneOffset).toUtc();
  }

  static DateTime dateOfFirstDay(int year, int month) {
    final date = DateTime(year, month, 1);
    return date.add(date.timeZoneOffset).toUtc();
  }

  static DateTime dateOfLastDay(int year, int month) {
    final date = DateTime(year, month + 1, 0);
    return date.add(date.timeZoneOffset).toUtc();
  }

  static DateTime dateOfNowFirstDay() {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, 1);
    return date.add(date.timeZoneOffset).toUtc();
  }

  static DateTime dateOfNowLastDay() {
    final now = DateTime.now();
    final calc = DateCalc(now.year, now.month).addMonth(1);
    return calc.add(calc.timeZoneOffset).toUtc();
  }

  static DateTime dateOfNowFirstTime() {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day, 0);
    return date.add(date.timeZoneOffset).toUtc();
  }

  static DateTime dateOfNowLastTime() {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day + 1, 0);
    return date.add(date.timeZoneOffset).toUtc();
  }

  static DateTime setDate(int year, int month) {
    final date = DateTime(year, month);
    return date.add(date.timeZoneOffset).toUtc();
  }

  static int diffHour(DateTime a, DateTime b) => a.difference(b).inHours;
  static int diffMinutes(DateTime a, DateTime b) => a.difference(b).inMinutes;

  // d1 >= d2 => true
  // d1 < d2 => false
  static bool isCompare(DateTime d1, DateTime d2) {
    if (d1.toUtc().compareTo(d2.toUtc()) != -1) {
      return true;
    } else {
      return false;
    }
  }

  // d1 == d2 => true
  // d1 != d2 => false
  static bool isEqual(DateTime d1, DateTime d2) {
    print('aaa ${d1.toUtc().compareTo(d2.toUtc())}');
    if (d1.toUtc().compareTo(d2.toUtc()) == 0) {
      return true;
    } else {
      return false;
    }
  }

  static String getMonthlyString(int month) {
    switch (month) {
      case 1:
        return 'Jan';
        break;
      case 2:
        return 'Feb';
        break;
      case 3:
        return 'Mar';
        break;
      case 4:
        return 'Apr';
        break;
      case 5:
        return 'May';
        break;
      case 6:
        return 'Jun';
        break;
      case 7:
        return 'Jul';
        break;
      case 8:
        return 'Aug';
        break;
      case 9:
        return 'Sep';
        break;
      case 10:
        return 'Oct';
        break;
      case 11:
        return 'Nov';
        break;
      case 12:
        return 'Dec';
        break;
      default:
        break;
    }
    return '';
  }
}
