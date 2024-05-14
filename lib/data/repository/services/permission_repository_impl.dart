import 'package:okoshki/data/services/permission_service.dart';
import 'package:okoshki/domain/repository/services/permission_repository.dart';

class PermissionRepositoryImpl extends PermissionRepository {
  PermissionRepositoryImpl({required PermissionService permissionService})
      : _permissionService = permissionService;

  final PermissionService _permissionService;

  @override
  Future<bool> requestCamera() {
    return _permissionService.requestCamera();
  }

  @override
  Future<bool> requestGeo() {
    return _permissionService.requestGeolocation();
  }

  @override
  Future<bool> requestNotifications() {
    return _permissionService.requestNotifications();
  }

  @override
  Future<bool> requestPhotoOrStorage() {
    return _permissionService.requestPhotoOrStorage();
  }
}
