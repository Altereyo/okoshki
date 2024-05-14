import 'dart:io';

import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/saloon_detail.dart';
import 'package:okoshki/domain/entities/saloon_photo.dart';

abstract class SaloonPhotoRepository {
  Future<ApiResource<SaloonDetail>> createLogo({
    required int saloonId,
    required File logo,
  });

  Future<ApiResource<SaloonDetail>> deleteLogo({
    required int saloonId,
  });

  Future<ApiResource<List<SaloonPhoto>>> getPhotoList({
    required int saloonId,
  });

  Future<ApiResource<SaloonPhoto>> createPhoto({
    required int saloonId,
    required File photo,
  });

  Future<ApiResource> deleteSaloonPhoto({
    required int photoId,
  });
}
