import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/saloon_balance.dart';

part 'saloon_balance.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SaloonBalanceModel extends SaloonBalance {
  
  SaloonBalanceModel({
    required super.id,
    required super.amount,
    required super.created,
    required super.transactionType,
    required super.transactionCategory,
  });

  factory SaloonBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$SaloonBalanceModelFromJson(json);
}
