import 'dart:math';

import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/extensions/date_time.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/entities/window_service.dart';
import 'package:validators2/sanitizers.dart';

extension WindowExtension on Window {
  DateTime get startDateTime => DateTime.parse(startDt).toLocal();
  DateTime get endDateTime => DateTime.parse(endDt).toLocal();

  //март 2024г.
  String get monthYear => DateFormat.yMMM().format(startDateTime);

  String get timeWindow => '${DateFormat(
        'HH:mm',
      ).format(startDateTime)} - ${DateFormat(
        'HH:mm',
      ).format(endDateTime)}';

  //'Сегодня, 20:00 - 21:00'
  String get dateTimeWindow {
    if (startDateTime.isToday) {
      return 'Сегодня, $timeWindow';
    } else if (startDateTime.isTomorrow) {
      return 'Завтра, $timeWindow';
    } else if (startDateTime.isAfterTomorrow) {
      return 'Послезавтра, $timeWindow';
    }
    //22 окт 2022 15:00 - 16:00
    return '${DateFormat.yMMMd().format(startDateTime)}, $timeWindow';
  }

  //'сегодня'
  String get dateDay {
    if (startDateTime.isToday) {
      return 'сегодня';
    } else if (startDateTime.isTomorrow) {
      return 'завтра';
    } else if (startDateTime.isAfterTomorrow) {
      return 'послезавтра';
    }
    return 'null';
  }

  String get minMaxPriceWindow {
    final listPrice = services
        .map(
          (e) => toInt(e.price),
        )
        .toList();
    if (listPrice.isNotEmpty) {
      final minPrice = listPrice.reduce(min);
      final maxPrice = listPrice.reduce(max);
      if (minPrice == maxPrice) {
        return '$minPrice ₽';
      }
      return '$minPrice - $maxPrice ₽';
    }
    return 'null';
  }

  String priceMinMaxServiceWindow(Service service) {
    final listServiceWindow =
        services.where((e) => e.service.id == service.id).toList();
    final listPrice = listServiceWindow.map((e) => toDouble(e.price)).toList();

    if (listPrice.isNotEmpty) {
      final minPrice = listPrice.reduce(min);
      final maxPrice = listPrice.reduce(max);
      if (minPrice == maxPrice) {
        return '$minPrice ₽';
      }
      return '$minPrice - $maxPrice ₽';
    }
    return 'null';
  }

  String? get minPriceWindow {
    final listPrice = services
        .map(
          (e) => toInt(e.price),
        )
        .toList();
    return 'от ${listPrice.reduce(min)} ₽';
  }

  //Количество типов услуг в окошке
  String countServicesTypeWindow(ServiceType serviceType) {
    final count = services
        .where(
          (element) => element.service.serviceType.id == serviceType.id,
        )
        .toList();
    return count.length.toString();
  }

  //Все типы услуг окошка
  List<ServiceType> servicesTypeWindow() {
    final List<ServiceType> servicesType = [];

    for (WindowService windowService in services) {
      //Если данного элемента нет в листе то добавить
      final res = servicesType.any(
        (element) => element.id == windowService.service.serviceType.id,
      );

      if (!res) {
        servicesType.add(windowService.service.serviceType);
      }
    }
    return servicesType;
  }

  //Все уникальные мастера
  List<SaloonMaster> mastersWindow() {
    List<SaloonMaster> masters = [];
    for (var serWind in services) {
      final res = masters.any((element) => element.id == serWind.master.id);
      if (!res) {
        masters.add(serWind.master);
      }
    }
    return masters;
  }

  //Все уникальные услуги окошка
  List<Service> get allServicesWindow {
    final List<Service> list = [];
    for (WindowService windowService in services) {
      //Если данного элемента нет в листе то добавить
      final res = list.any(
        (element) => element.id == windowService.service.id,
      );
      if (!res) {
        list.add(windowService.service);
      }
    }
    return list;
  }

  Map<int, List<WindowService>> get windowServiceGroup {
    return groupBy(services, (val) => val.service.id);
  }
}
