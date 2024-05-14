class AppSetting {
  final String telegramId;
  final String phoneNumber;

  AppSetting({
    required this.telegramId,
    required this.phoneNumber,
  });

  @override
  String toString() => '$telegramId $phoneNumber';
}
