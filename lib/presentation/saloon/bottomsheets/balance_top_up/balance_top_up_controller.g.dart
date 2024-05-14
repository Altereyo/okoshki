// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_top_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BalanceTopUpController on _BalanceTopUpController, Store {
  Computed<bool>? _$isEnabledButtonTopUpComputed;

  @override
  bool get isEnabledButtonTopUp => (_$isEnabledButtonTopUpComputed ??=
          Computed<bool>(() => super.isEnabledButtonTopUp,
              name: '_BalanceTopUpController.isEnabledButtonTopUp'))
      .value;

  late final _$sumAtom =
      Atom(name: '_BalanceTopUpController.sum', context: context);

  @override
  String get sum {
    _$sumAtom.reportRead();
    return super.sum;
  }

  @override
  set sum(String value) {
    _$sumAtom.reportWrite(value, super.sum, () {
      super.sum = value;
    });
  }

  late final _$buttonAtom =
      Atom(name: '_BalanceTopUpController.button', context: context);

  @override
  int? get button {
    _$buttonAtom.reportRead();
    return super.button;
  }

  @override
  set button(int? value) {
    _$buttonAtom.reportWrite(value, super.button, () {
      super.button = value;
    });
  }

  @override
  String toString() {
    return '''
sum: ${sum},
button: ${button},
isEnabledButtonTopUp: ${isEnabledButtonTopUp}
    ''';
  }
}
