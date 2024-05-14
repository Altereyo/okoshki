import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon_detail.dart';
import 'package:okoshki/domain/state/saloon/comments_store.dart';
import 'package:okoshki/domain/state/saloon/master_store.dart';
import 'package:okoshki/domain/state/saloon/photo_store.dart';
import 'package:okoshki/domain/state/saloon/stock_store.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';

part 'profile_controller.g.dart';

// ignore: library_private_types_in_public_api
class ProfileSaloonController = _ProfileSaloonController
    with _$ProfileSaloonController;

abstract class _ProfileSaloonController with Store {
  _ProfileSaloonController({
    required SaloonStore saloonStore,
    required MasterSaloonStore masterSaloonStore,
    required PhotoSaloonStore photoSaloonStore,
    required StockSaloonStore stockSaloonStore,
    required CommentsSaloonStore commentsSaloonStore,
  })  : _saloonStore = saloonStore,
        _masterSaloonStore = masterSaloonStore,
        _photoSaloonStore = photoSaloonStore,
        _stockSaloonStore = stockSaloonStore,
        _commentsSaloonStore = commentsSaloonStore;

  final SaloonStore _saloonStore;
  final MasterSaloonStore _masterSaloonStore;
  final PhotoSaloonStore _photoSaloonStore;
  final StockSaloonStore _stockSaloonStore;
  final CommentsSaloonStore _commentsSaloonStore;

  @computed
  bool get isSaloonData =>
      _saloonStore.saloonDetail.title == null ||
      _saloonStore.saloonDetail.address == null ||
      _saloonStore.saloonDetail.logo == null ||
      _saloonStore.saloonDetail.site == null ||
      _saloonStore.saloonDetail.description == null ||
      _photoSaloonStore.saloonPhotosList.isEmpty;

  @computed
  bool get isLoading =>
      _saloonStore.isLoading ||
      _masterSaloonStore.isLoading ||
      _photoSaloonStore.isLoading;

  String get numMastersSaloon => _masterSaloonStore.numMastersSaloon;

  String get numServices =>
      _saloonStore.saloonDetail.services!.length.toString();

  String get numStock => _stockSaloonStore.numStock;

  String get numComments => _commentsSaloonStore.numComments;

  SaloonDetail get saloonDetails => _saloonStore.saloonDetail;

  Future<void> refreshDetails() async {
    _saloonStore.refresh();
  }
}
