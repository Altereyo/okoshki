import 'package:json_annotation/json_annotation.dart';

part 'get_saloon_list.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetSaloonListBody {
  final String? polygon;
  final String? point;
  final int? distance;
  final String? services;
  final String? sort;
  final String? windows;
  final bool? owner;
  final String? search;
  final int? cost;
  final String? windowsDate;
  final int? page;
  final int? pageSize;

  const GetSaloonListBody({
    this.polygon,
    this.point,
    this.distance,
    this.services,
    this.sort,
    this.windows,
    this.owner,
    this.search,
    this.cost,
    this.windowsDate,
    this.page,
    this.pageSize,
  });

  Map<String, dynamic> toJson() => _$GetSaloonListBodyToJson(this);
}
