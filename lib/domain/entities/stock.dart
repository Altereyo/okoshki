class Stock {
  final int id;
  final String title;
  final String duration;
  final String? description;
  final String? logo;

  const Stock({
    required this.id,
    required this.title,
    required this.duration,
    this.description,
    this.logo,
  });

  @override
  String toString() => '$id $title $duration $description $logo';
  
}
