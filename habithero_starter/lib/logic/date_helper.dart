/// Returns the date of [now] (default: today) as `yyyy-MM-dd`.
String todayKey([DateTime? now]) =>
    (now ?? DateTime.now()).toIso8601String().substring(0, 10);
