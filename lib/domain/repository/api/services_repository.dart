import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/service_type.dart';

abstract class ServicesRepository {
  Future<ApiResource<List<ServiceType>>> getServicesTypes();

  /// *exclude* - exclude occupied services by master
  Future<ApiResource<List<Service>>> getServicesList({
    int? serviceTypeId,
    int? saloonId,
    int? masterId,
    bool? exclude,
  });
}
