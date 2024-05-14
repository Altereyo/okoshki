import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/client_blocking.dart';

extension ClientBlockingExtension on ClientBlocking {
  DateTime get dateTime => DateTime.parse(blockingTo).toLocal();
 

  //март 2024г.
  String get dateBlocking => DateFormat.yMMMd().format(dateTime);


}
