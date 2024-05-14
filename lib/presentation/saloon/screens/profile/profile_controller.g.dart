// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileSaloonController on _ProfileSaloonController, Store {
  Computed<bool>? _$isSaloonDataComputed;

  @override
  bool get isSaloonData =>
      (_$isSaloonDataComputed ??= Computed<bool>(() => super.isSaloonData,
              name: '_ProfileSaloonController.isSaloonData'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_ProfileSaloonController.isLoading'))
          .value;

  @override
  String toString() {
    return '''
isSaloonData: ${isSaloonData},
isLoading: ${isLoading}
    ''';
  }
}
