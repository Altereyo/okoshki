// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_stock_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditStockController on _EditStockController, Store {
  Computed<bool>? _$isEnabledButtonEditComputed;

  @override
  bool get isEnabledButtonEdit => (_$isEnabledButtonEditComputed ??=
          Computed<bool>(() => super.isEnabledButtonEdit,
              name: '_EditStockController.isEnabledButtonEdit'))
      .value;

  late final _$titleAtom =
      Atom(name: '_EditStockController.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$durationAtom =
      Atom(name: '_EditStockController.duration', context: context);

  @override
  String get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(String value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_EditStockController.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$logoAtom =
      Atom(name: '_EditStockController.logo', context: context);

  @override
  String? get logo {
    _$logoAtom.reportRead();
    return super.logo;
  }

  @override
  set logo(String? value) {
    _$logoAtom.reportWrite(value, super.logo, () {
      super.logo = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
duration: ${duration},
description: ${description},
logo: ${logo},
isEnabledButtonEdit: ${isEnabledButtonEdit}
    ''';
  }
}
