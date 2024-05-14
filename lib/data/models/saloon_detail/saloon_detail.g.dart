// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saloon_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaloonDetailModel _$SaloonDetailModelFromJson(Map<String, dynamic> json) =>
    SaloonDetailModel(
      id: json['id'] as int,
      uid: json['uid'] as String,
      title: json['title'] as String?,
      balance: json['balance'] as String?,
      description: json['description'] as String?,
      balanceLastUpdate: json['balance_last_update'] as String?,
      addressModel: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      logo: json['logo'] as String?,
      commission: json['commission'] as int?,
      site: json['site'] as String?,
      appliedCommission: json['applied_commission'] as int?,
      isPremium: json['is_premium'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      numComment: json['num_comment'] as int?,
      servicesModel: (json['services'] as List<dynamic>?)
          ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      usersLiked: json['users_liked'] as int?,
      applyTariff: json['apply_tariff'] as int?,
      distance: (json['distance'] as num?)?.toDouble(),
      isFavorite: json['is_favorite'] as bool?,
      salonBlocking: json['salon_blocking'] as bool?,
      canAddComment: json['can_add_comment'] as bool?,
    );

Map<String, dynamic> _$SaloonDetailModelToJson(SaloonDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'title': instance.title,
      'balance': instance.balance,
      'description': instance.description,
      'balance_last_update': instance.balanceLastUpdate,
      'logo': instance.logo,
      'commission': instance.commission,
      'site': instance.site,
      'applied_commission': instance.appliedCommission,
      'is_premium': instance.isPremium,
      'rating': instance.rating,
      'num_comment': instance.numComment,
      'users_liked': instance.usersLiked,
      'apply_tariff': instance.applyTariff,
      'distance': instance.distance,
      'is_favorite': instance.isFavorite,
      'salon_blocking': instance.salonBlocking,
      'can_add_comment': instance.canAddComment,
      'address': instance.addressModel,
      'services': instance.servicesModel,
    };
