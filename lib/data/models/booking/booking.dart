import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/data/models/saloon/saloon.dart';
import 'package:okoshki/data/models/window/window.dart';
import 'package:okoshki/data/models/window_service/window_service.dart';
import 'package:okoshki/domain/entities/booking.dart';

part 'booking.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BookingModel extends Booking {
  @JsonKey(name: 'service')
  final WindowServiceModel serviceModel;
  @JsonKey(name: 'window')
  final WindowModel windowModel;
  @JsonKey(name: 'salon')
  final SaloonModel salonModel;

  const BookingModel({
    required super.id,
    required super.uid,
    required super.status,
    required this.serviceModel,
    required this.windowModel,
    required this.salonModel,
  }) : super(
          service: serviceModel,
          window: windowModel,
          salon: salonModel,
        );
  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}
