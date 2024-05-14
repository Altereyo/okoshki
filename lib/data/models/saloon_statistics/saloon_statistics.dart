import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/saloon_statistics.dart';

part 'saloon_statistics.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SaloonStatisticsModel extends SaloonStatistics {
  
  const SaloonStatisticsModel({
    required super.numWindows,
    required super.numBookings,
    required super.amountProfit,
    required super.windowsCommissions,
    required super.numDoneWindows,
    required super.numClientCancelWindows,
    required super.numClientNotComeWindows,
    required super.numNotBookingWindows,
  });

  factory SaloonStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$SaloonStatisticsModelFromJson(json);
}
