import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/saloon_balance.dart';

extension SaloonBalanceExtension on SaloonBalance {
  DateTime get dateTime => DateTime.parse(created).toLocal();
  String get time => DateFormat('HH:mm').format(dateTime);
  String get amountCurrency {
    if(transactionType == 'REFILL'){
      return '+${NumberFormat('#.###').format(double.parse(amount))} ₽';
    }
    return '-${NumberFormat('#.###').format(double.parse(amount))} ₽';
  }

  //март 2024г.
  String get monthYear => DateFormat.yMMM().format(dateTime);
}
