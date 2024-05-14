// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_connect_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PremiumConnectController on _PremiumConnectController, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_PremiumConnectController.isLoading'))
          .value;

  late final _$selectPremiumTariffAtom = Atom(
      name: '_PremiumConnectController.selectPremiumTariff', context: context);

  @override
  PremiumTariff? get selectPremiumTariff {
    _$selectPremiumTariffAtom.reportRead();
    return super.selectPremiumTariff;
  }

  @override
  set selectPremiumTariff(PremiumTariff? value) {
    _$selectPremiumTariffAtom.reportWrite(value, super.selectPremiumTariff, () {
      super.selectPremiumTariff = value;
    });
  }

  late final _$monthButtonAtom =
      Atom(name: '_PremiumConnectController.monthButton', context: context);

  @override
  int get monthButton {
    _$monthButtonAtom.reportRead();
    return super.monthButton;
  }

  @override
  set monthButton(int value) {
    _$monthButtonAtom.reportWrite(value, super.monthButton, () {
      super.monthButton = value;
    });
  }

  @override
  String toString() {
    return '''
selectPremiumTariff: ${selectPremiumTariff},
monthButton: ${monthButton},
isLoading: ${isLoading}
    ''';
  }
}
