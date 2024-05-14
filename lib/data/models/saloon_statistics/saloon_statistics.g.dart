// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saloon_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaloonStatisticsModel _$SaloonStatisticsModelFromJson(
        Map<String, dynamic> json) =>
    SaloonStatisticsModel(
      numWindows: json['num_windows'] as int,
      numBookings: json['num_bookings'] as int,
      amountProfit: json['amount_profit'] as int,
      windowsCommissions: json['windows_commissions'] as int,
      numDoneWindows: json['num_done_windows'] as int,
      numClientCancelWindows: json['num_client_cancel_windows'] as int,
      numClientNotComeWindows: json['num_client_not_come_windows'] as int,
      numNotBookingWindows: json['num_not_booking_windows'] as int,
    );

Map<String, dynamic> _$SaloonStatisticsModelToJson(
        SaloonStatisticsModel instance) =>
    <String, dynamic>{
      'num_windows': instance.numWindows,
      'num_bookings': instance.numBookings,
      'amount_profit': instance.amountProfit,
      'windows_commissions': instance.windowsCommissions,
      'num_done_windows': instance.numDoneWindows,
      'num_client_cancel_windows': instance.numClientCancelWindows,
      'num_client_not_come_windows': instance.numClientNotComeWindows,
      'num_not_booking_windows': instance.numNotBookingWindows,
    };
