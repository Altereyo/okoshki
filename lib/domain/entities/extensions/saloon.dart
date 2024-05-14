import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/saloon.dart';

extension SaloonExtension on Saloon {
  String? get distanceToString {
    if (distance == null) {
      return null;
    } else {
      return distance! < 1000
          ? '${NumberFormat('###').format(distance)} м'
          : '${NumberFormat('###.0').format(distance! / 1000)} км';
    }
  }
}
