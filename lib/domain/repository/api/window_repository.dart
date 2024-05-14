import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/entities/window_service.dart';

abstract class WindowRepository {
  Future<ApiResource<List<Window>>> getWindowList({
    required int saloonId,
    String? status,
    DateTime? from,
    DateTime? to,
  });

  Future<ApiResource<Window>> createWindow({
    required int saloonId,
    required Window window,
  });

  Future<ApiResource<Window>> getWindowDetails({
    required int windowId,
  });

  Future<ApiResource<Window>> updateWindow({
    required int windowId,
    String? startDt,
    String? endDt,
    required List<WindowService> delete,
    required List<WindowService> update,
    required List<WindowService> create,
  });

  Future<ApiResource<Window>> updateStatusWindow({
    required int windowId,
    required String status,
  });

  Future<ApiResource> deleteWindow({
    required int windowId,
  });
}
