// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_booking_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBookingListBody _$GetBookingListBodyFromJson(Map<String, dynamic> json) =>
    GetBookingListBody(
      salon: json['salon'] as int?,
      from: json['from'] as String?,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$GetBookingListBodyToJson(GetBookingListBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('salon', instance.salon);
  writeNotNull('from', instance.from);
  writeNotNull('to', instance.to);
  return val;
}
