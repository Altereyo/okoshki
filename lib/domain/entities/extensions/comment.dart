import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/comment.dart';

extension CommentExtension on Comment {
  DateTime get createdDateTime => DateTime.parse(created).toLocal();

  //март 2024г.
  String get monthYear {
     if (moderateComment != null) {
      final updateDateTime = DateTime.parse(moderateComment!.updated).toLocal();
      return DateFormat.yMMM().format(updateDateTime);
    } else {
      return DateFormat.yMMM().format(createdDateTime);
    }
  }

  //20 июля 2022
  String get createUpdateDate {
    if (moderateComment != null) {
      final updateDateTime = DateTime.parse(moderateComment!.updated).toLocal();
      return DateFormat.yMMMMd().format(updateDateTime);
    } else {
      return DateFormat.yMMMMd().format(createdDateTime);
    }
  }

  String get createUpdateStatus {
    if (moderateComment != null) {
      return moderateComment!.status;
    } else {
      return status;
    }
  }
   String get createUpdateText {
    if (moderateComment != null) {
      return moderateComment!.text;
    } else {
      return text;
    }
  }

  String get userNameClient {
    if (client.username == null || client.username!.isEmpty) {
      return 'Имя не указано';
    } else {
      return client.username!;
    }
  }

  String get abbreviationUserName {
    if (client.username == null || client.username!.isEmpty) {
      return 'И';
    } else {
      return client.username!.trim()[0].toUpperCase();
    }
  }
}
