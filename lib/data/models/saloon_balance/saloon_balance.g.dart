// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saloon_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaloonBalanceModel _$SaloonBalanceModelFromJson(Map<String, dynamic> json) =>
    SaloonBalanceModel(
      id: json['id'] as int,
      amount: json['amount'] as String,
      created: json['created'] as String,
      transactionType: json['transaction_type'] as String,
      transactionCategory: json['transaction_category'] as String?,
    );

Map<String, dynamic> _$SaloonBalanceModelToJson(SaloonBalanceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'created': instance.created,
      'transaction_type': instance.transactionType,
      'transaction_category': instance.transactionCategory,
    };
