class Premium {
  final int id;
  final String startDate;
  final String endDate;

  Premium({
    required this.id,
    required this.startDate,
    required this.endDate,
  });

  @override
  String toString() => '$id $startDate $endDate';
}
