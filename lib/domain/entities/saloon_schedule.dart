class SaloonSchedule {
  final int id;
  final int weekDay;
  String startTime;
  String endTime;
  bool weekend;

  SaloonSchedule({
    required this.id,
    required this.weekDay,
    required this.startTime,
    required this.endTime,
    required this.weekend,
  });
}