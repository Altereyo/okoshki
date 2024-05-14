import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/data/models/booking_client/booking_client.dart';
import 'package:okoshki/domain/entities/booking_window.dart';

part 'booking_window.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BookingWindowModel extends BookingWindow {
  final int service;
  @JsonKey(name: 'client')
  final BookingClientModel clientModel;

  const BookingWindowModel({
    required super.id,
    required super.uid,
    required this.service,
    required this.clientModel,
    required super.status,
    super.commissionAmount,
  }) : super(
          windowServiceId: service,
          client: clientModel,
        );
  factory BookingWindowModel.fromJson(Map<String, dynamic> json) =>
      _$BookingWindowModelFromJson(json);
}
