import 'package:okoshki/data/models/window_service/window_service.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/window_service.dart';

abstract class WindowServiceRepository {
  Future<ApiResource<WindowService>> getWindowServiceDetail(
      {required int windowServiceId});

  Future<ApiResource<WindowService>> createWindowService({
    required int windowId,
    required int masterId,
    required int serviceId,
    required double price,
  });

  Future<ApiResource<WindowServiceModel>> updateWindowService({
    required int windowServiceId,
    int? masterId,
    double? price,
  });

  Future<ApiResource> deleteWindowService({
   required int windowServiceId,}
  );
}
