// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tariffs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TariffsSaloonStore on _TariffsSaloonStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_TariffsSaloonStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$premiumTarriffsListAtom =
      Atom(name: '_TariffsSaloonStore.premiumTarriffsList', context: context);

  @override
  ObservableList<PremiumTariff> get premiumTarriffsList {
    _$premiumTarriffsListAtom.reportRead();
    return super.premiumTarriffsList;
  }

  @override
  set premiumTarriffsList(ObservableList<PremiumTariff> value) {
    _$premiumTarriffsListAtom.reportWrite(value, super.premiumTarriffsList, () {
      super.premiumTarriffsList = value;
    });
  }

  late final _$premiumAtom =
      Atom(name: '_TariffsSaloonStore.premium', context: context);

  @override
  Premium? get premium {
    _$premiumAtom.reportRead();
    return super.premium;
  }

  @override
  set premium(Premium? value) {
    _$premiumAtom.reportWrite(value, super.premium, () {
      super.premium = value;
    });
  }

  late final _$_getPrimiumTariffsListAsyncAction = AsyncAction(
      '_TariffsSaloonStore._getPrimiumTariffsList',
      context: context);

  @override
  Future<void> _getPrimiumTariffsList() {
    return _$_getPrimiumTariffsListAsyncAction
        .run(() => super._getPrimiumTariffsList());
  }

  late final _$createSaloonPremiumTariffAsyncAction = AsyncAction(
      '_TariffsSaloonStore.createSaloonPremiumTariff',
      context: context);

  @override
  Future<bool> createSaloonPremiumTariff({required int premiumTariffId}) {
    return _$createSaloonPremiumTariffAsyncAction.run(() =>
        super.createSaloonPremiumTariff(premiumTariffId: premiumTariffId));
  }

  late final _$_getSaloonPremiumTariffsListAsyncAction = AsyncAction(
      '_TariffsSaloonStore._getSaloonPremiumTariffsList',
      context: context);

  @override
  Future<void> _getSaloonPremiumTariffsList() {
    return _$_getSaloonPremiumTariffsListAsyncAction
        .run(() => super._getSaloonPremiumTariffsList());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
premiumTarriffsList: ${premiumTarriffsList},
premium: ${premium}
    ''';
  }
}
