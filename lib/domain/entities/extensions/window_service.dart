import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/window_service.dart';

extension WindowServiceExtinsion on WindowService {
  String get priceCurrency => '${NumberFormat('#.###').format(
        double.parse(price),
      )} ₽';
}
