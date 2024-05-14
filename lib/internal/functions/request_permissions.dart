import 'package:okoshki/domain/repository/services/permission_repository.dart';
import 'package:okoshki/internal/utils/sl.dart';

Future<void> requestPermissions() async {
  final repo = sl<PermissionRepository>();
  await repo.requestGeo();
  await repo.requestNotifications();
  await repo.requestPhotoOrStorage();
  await repo.requestCamera();
}
