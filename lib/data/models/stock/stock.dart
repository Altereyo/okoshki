import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/stock.dart';

part 'stock.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StockModel extends Stock {
  const StockModel({
    required super.id,
    required super.title,
    required super.duration,
    super.description,
    super.logo,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) =>
      _$StockModelFromJson(json);
}
