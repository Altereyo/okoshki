class PremiumTariff {
  final int id;
  final int duration;
  final String price;

  PremiumTariff({
    required this.id,
    required this.duration,
    required this.price,
  });

  @override
  String toString() => '$id $duration $price';
}
