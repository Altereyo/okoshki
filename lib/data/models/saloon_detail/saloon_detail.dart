import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/data/models/address/address.dart';
import 'package:okoshki/data/models/service/service.dart';
import 'package:okoshki/domain/entities/saloon_detail.dart';

part 'saloon_detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SaloonDetailModel extends SaloonDetail {
  @JsonKey(name: 'address')
  final AddressModel? addressModel;
  @JsonKey(name: 'services')
  final List<ServiceModel>? servicesModel;

  SaloonDetailModel({
    required super.id,
    required super.uid,
    super.title,
    super.balance,
    super.description,
    super.balanceLastUpdate,
    this.addressModel,
    super.logo,
    super.commission,
    super.site,
    super.appliedCommission,
    super.isPremium,
    super.rating,
    super.numComment,
    this.servicesModel,
    super.usersLiked,
    super.applyTariff,
    super.distance,
    super.isFavorite,
    super.salonBlocking,
    super.canAddComment,
  }) : super(
          address: addressModel,
          services: servicesModel,
        );

  factory SaloonDetailModel.fromJson(Map<String, dynamic> json) =>
      _$SaloonDetailModelFromJson(json);
}
