import 'package:json_annotation/json_annotation.dart';

part 'get_window_list.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetWindowListBody {
  final int salon;
  final String? status;
  final String? from;
  final String? to;

  const GetWindowListBody({
    required this.salon,
    this.status,
    this.from,
    this.to,
  });

  Map<String, dynamic> toJson() => _$GetWindowListBodyToJson(this);
}
