import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/premium.dart';

extension PremiumEtension on Premium {
  DateTime get startDateTime => DateTime.parse(startDate).toLocal();
  DateTime get endDateTime => DateTime.parse(endDate).toLocal();

  String get endPremium => DateFormat.yMMMMd().format(endDateTime);
}
