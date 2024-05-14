import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/premium_tariff.dart';

part 'premium_tariff.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PremiumTariffModel extends PremiumTariff {
  PremiumTariffModel({
    required super.id,
    required super.duration,
    required super.price,
  });

  factory PremiumTariffModel.fromJson(Map<String, dynamic> json) =>
      _$PremiumTariffModelFromJson(json);

}
