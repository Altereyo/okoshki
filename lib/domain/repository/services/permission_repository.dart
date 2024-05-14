abstract class PermissionRepository {
  Future<bool> requestGeo();
  Future<bool> requestCamera();
  Future<bool> requestNotifications();

  /// from android sdk 32 we must request photo instead of storage
  Future<bool> requestPhotoOrStorage();
}