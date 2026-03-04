abstract interface class DateTimeService {
  DateTime now();
}

class DateTimeServiceImpl implements DateTimeService {
  @override
  DateTime now() => DateTime.now();
}
