import 'package:json_annotation/json_annotation.dart';

part 'get_booking_list.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetBookingListBody {
  final int? salon;
  final String? from;
  final String? to;

  const GetBookingListBody({
     this.salon,
    this.from,
    this.to,
  });

  Map<String, dynamic> toJson() => _$GetBookingListBodyToJson(this);
}
