// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_work_shedule_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditWorkSheduleController on _EditWorkSheduleController, Store {
  late final _$editSheduleListAtom = Atom(
      name: '_EditWorkSheduleController.editSheduleList', context: context);

  @override
  ObservableList<SaloonSchedule> get editSheduleList {
    _$editSheduleListAtom.reportRead();
    return super.editSheduleList;
  }

  @override
  set editSheduleList(ObservableList<SaloonSchedule> value) {
    _$editSheduleListAtom.reportWrite(value, super.editSheduleList, () {
      super.editSheduleList = value;
    });
  }

  @override
  String toString() {
    return '''
editSheduleList: ${editSheduleList}
    ''';
  }
}
