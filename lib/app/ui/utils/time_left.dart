class TimeLeft {
  int daysLeft({
    required DateTime now,
    required DateTime limit,
  }) {
    final int _daysUntil = dateBetween(now, limit).inDays;
    if (_daysUntil < 0) return 0;

    return _daysUntil;
  }

  int hoursLeft({
    required DateTime now,
    required DateTime limit,
    required int daysLeft,
  }) {
    final int _hoursLeft = dateBetween(now, limit).inHours - (daysLeft * 24);
    if (_hoursLeft < 0) return 0;
    return _hoursLeft;
  }

  int minutesLeft({
    required DateTime now,
    required DateTime limit,
    required int daysLeft,
    required int hourLeft,
  }) {
    final int _minutesLeft = dateBetween(now, limit).inMinutes -
        (daysLeft * 1440 /*24*60*/) -
        (hourLeft * 60);
    if (_minutesLeft < 0) return 0;
    return _minutesLeft;
  }

  int secondsLeft({
    required DateTime now,
    required DateTime limit,
    required int daysLeft,
    required int hourLeft,
    required int minuteLeft,
  }) {
    final int _secondsLeft = dateBetween(now, limit).inSeconds -
        (daysLeft * 86400 /*24*60*60*/) -
        (hourLeft * 3600) -
        (minuteLeft * 60);
    if (_secondsLeft < 0) return 0;
    return _secondsLeft; 
  }

  Duration dateBetween(DateTime now, DateTime limit) {
    return limit.difference(now);
  }
}
