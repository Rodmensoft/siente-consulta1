class TimeLeft {
  int daysLeft({
    required DateTime now,
    required DateTime limit,
  }) {
    final int daysUntil = dateBetween(now, limit).inDays;
    if (daysUntil < 0) return 0;

    return daysUntil;
  }

  int hoursLeft({
    required DateTime now,
    required DateTime limit,
    required int daysLeft,
  }) {
    final int hoursLeft = dateBetween(now, limit).inHours - (daysLeft * 24);
    if (hoursLeft < 0) return 0;
    return hoursLeft;
  }

  int minutesLeft({
    required DateTime now,
    required DateTime limit,
    required int daysLeft,
    required int hourLeft,
  }) {
    final int minutesLeft = dateBetween(now, limit).inMinutes -
        (daysLeft * 1440 /*24*60*/) -
        (hourLeft * 60);
    if (minutesLeft < 0) return 0;
    return minutesLeft;
  }

  int secondsLeft({
    required DateTime now,
    required DateTime limit,
    required int daysLeft,
    required int hourLeft,
    required int minuteLeft,
  }) {
    final int secondsLeft = dateBetween(now, limit).inSeconds -
        (daysLeft * 86400 /*24*60*60*/) -
        (hourLeft * 3600) -
        (minuteLeft * 60);
    if (secondsLeft < 0) return 0;
    return secondsLeft;
  }

  Duration dateBetween(DateTime now, DateTime limit) {
    return limit.difference(now);
  }
}
