// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saloon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaloonModel _$SaloonModelFromJson(Map<String, dynamic> json) => SaloonModel(
      id: json['id'] as int,
      title: json['title'] as String,
      addressModel: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      isPremium: json['is_premium'] as bool,
      rating: (json['rating'] as num).toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      usersLiked: (json['users_liked'] as num?)?.toDouble(),
      logo: json['logo'] as String?,
      salonBlocking: json['salon_blocking'] as bool?,
      maxActiveBooking: json['max_active_booking'] as bool?,
      currentWindowsModel: (json['current_windows'] as List<dynamic>?)
          ?.map((e) => CurrentWindowModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaloonModelToJson(SaloonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_premium': instance.isPremium,
      'rating': instance.rating,
      'distance': instance.distance,
      'users_liked': instance.usersLiked,
      'logo': instance.logo,
      'salon_blocking': instance.salonBlocking,
      'max_active_booking': instance.maxActiveBooking,
      'address': instance.addressModel,
      'current_windows': instance.currentWindowsModel,
    };
