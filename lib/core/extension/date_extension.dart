extension WeekdayExtension on DateTime {
  String get shortWeekday {
    const weekdays = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
    return weekdays[weekday % 7];
  }
}