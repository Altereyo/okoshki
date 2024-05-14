import 'package:okoshki/domain/entities/service.dart';

import 'address.dart';

class SaloonDetail {
  final int id;
  final String uid;
  String? title;
  final String? balance;
  String? description;
  final String? balanceLastUpdate;
  final Address? address;
  final String? logo;
  final int? commission;
  final String? site;
  final int? appliedCommission;
  final bool? isPremium;
  final double? rating;
  final int? numComment;
  final List<Service>? services;
  final int? usersLiked;
  final int? applyTariff;
  final double? distance;
  final bool? isFavorite;
  final bool? salonBlocking;
  final bool? canAddComment;

  SaloonDetail({
    required this.id,
    required this.uid,
    this.title,
    this.balance,
    this.description,
    this.balanceLastUpdate,
    this.address,
    this.logo,
    this.commission,
    this.site,
    this.appliedCommission,
    this.isPremium,
    this.rating,
    this.numComment,
    this.services,
    this.usersLiked,
    this.applyTariff,
    this.distance,
    this.isFavorite,
    this.salonBlocking,
    this.canAddComment,
  });
}
