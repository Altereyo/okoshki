import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/booking_client.dart';

part 'booking_client.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BookingClientModel extends BookingClient {
  const BookingClientModel({
    required super.id,
    required super.username,
    required super.phoneNumber,
  });
  factory BookingClientModel.fromJson(Map<String, dynamic> json) =>
      _$BookingClientModelFromJson(json);
}
