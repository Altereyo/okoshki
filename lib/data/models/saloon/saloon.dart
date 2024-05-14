import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/data/models/address/address.dart';
import 'package:okoshki/data/models/current_window/current_window.dart';
import 'package:okoshki/domain/entities/saloon.dart';

part 'saloon.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SaloonModel extends Saloon {
  @JsonKey(name: 'address')
  final AddressModel? addressModel;
  @JsonKey(name: 'current_windows')
  final List<CurrentWindowModel>? currentWindowsModel;

  const SaloonModel({
    required super.id,
    required super.title,
    required this.addressModel,
    required super.isPremium,
    required super.rating,
    required super.distance,
    required super.usersLiked,
    required super.logo,
    required super.salonBlocking,
    required super.maxActiveBooking,
    required this.currentWindowsModel,
  }) : super(
          address: addressModel,
          currentWindows: currentWindowsModel,
        );

  factory SaloonModel.fromJson(Map<String, dynamic> json) =>
      _$SaloonModelFromJson(json);
}
