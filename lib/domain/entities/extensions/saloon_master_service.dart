import 'package:okoshki/domain/entities/saloon_master_service.dart';

extension SaloonMasterSeviceExtension on SaloonMasterService {
  SaloonMasterService copyWith({
    String? price,
    bool? isActive,
  }) =>
      SaloonMasterService(
        id: id,
        master: master,
        service: service,
        price: price?? this.price,
        isActive: isActive?? this.isActive,
      );
}
