import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/premium_tariff.dart';

extension PremiumTariffEtension on PremiumTariff {


  String get priceCurrency=> '${NumberFormat('#.###').format(double.parse(price))} ₽';
}
