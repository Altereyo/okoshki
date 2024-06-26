class CalendarEvent {
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  String? description;
  String? location;

  CalendarEvent({
    required this.title,
    required this.startDate,
    required this.endDate,
    this.description,
    this.location,
  });
}
