// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_window_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MasterWindowController on _MasterWindowController, Store {
  late final _$windowServiceIdAtom =
      Atom(name: '_MasterWindowController.windowServiceId', context: context);

  @override
  int? get windowServiceId {
    _$windowServiceIdAtom.reportRead();
    return super.windowServiceId;
  }

  @override
  set windowServiceId(int? value) {
    _$windowServiceIdAtom.reportWrite(value, super.windowServiceId, () {
      super.windowServiceId = value;
    });
  }

  late final _$priseAtom =
      Atom(name: '_MasterWindowController.prise', context: context);

  @override
  String? get prise {
    _$priseAtom.reportRead();
    return super.prise;
  }

  @override
  set prise(String? value) {
    _$priseAtom.reportWrite(value, super.prise, () {
      super.prise = value;
    });
  }

  late final _$isSelectAtom =
      Atom(name: '_MasterWindowController.isSelect', context: context);

  @override
  bool get isSelect {
    _$isSelectAtom.reportRead();
    return super.isSelect;
  }

  @override
  set isSelect(bool value) {
    _$isSelectAtom.reportWrite(value, super.isSelect, () {
      super.isSelect = value;
    });
  }

  @override
  String toString() {
    return '''
windowServiceId: ${windowServiceId},
prise: ${prise},
isSelect: ${isSelect}
    ''';
  }
}
