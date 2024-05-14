import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/data/models/booking_window/booking_window.dart';
import 'package:okoshki/data/models/window_service/window_service.dart';
import 'package:okoshki/domain/entities/window.dart';

part 'window.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WindowModel extends Window {
  @JsonKey(name: 'services')
  final List<WindowServiceModel> servicesModel;
  @JsonKey(name: 'bookings')
  final List<BookingWindowModel>? bookingsModel;

  WindowModel({
    required super.id,
    required super.startDt,
    required super.endDt,
    required super.status,
    required this.servicesModel,
    this.bookingsModel,
  }) : super(
          services: servicesModel,
          bookingsWindow: bookingsModel,
        );

  factory WindowModel.fromJson(Map<String, dynamic> json) =>
      _$WindowModelFromJson(json);

  @override
  String toString() {
    return '$id $startDt $endDt $status $services';
  }
}
