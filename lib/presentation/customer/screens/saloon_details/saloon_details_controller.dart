import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/comment.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/domain/entities/saloon_detail.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';
import 'package:okoshki/domain/entities/saloon_photo.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';
import 'package:okoshki/domain/entities/social_network.dart';
import 'package:okoshki/domain/entities/stock.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/repository/services/share_repository.dart';
import 'package:okoshki/domain/repository/services/url_launcher_repository.dart';
import 'package:okoshki/domain/state/customer/saloon_details_store.dart';

part 'saloon_details_controller.g.dart';

// ignore: library_private_types_in_public_api
class SaloonDetailsCustomerController = _SaloonDetailsCustomerController
    with _$SaloonDetailsCustomerController;

abstract class _SaloonDetailsCustomerController with Store {
  _SaloonDetailsCustomerController({
    required SaloonDetailsCustomerStore saloonDetailsCustomerStore,
    required ShareRepository shareRepository,
    required UrlLauncherRepository urlLauncherRepository,
  })  : _saloonDetailsCustomerStore = saloonDetailsCustomerStore,
        _shareRepository = shareRepository,
        _urlLauncherRepository = urlLauncherRepository;

  final SaloonDetailsCustomerStore _saloonDetailsCustomerStore;
  final ShareRepository _shareRepository;
  final UrlLauncherRepository _urlLauncherRepository;

  Future<void> init() async {
    await asyncWhen((_) => _saloonDetailsCustomerStore.isLoading == false);
    initItemCountComment();
  }

  SaloonDetail get saloonDetail => _saloonDetailsCustomerStore.saloonDetail;
  bool get whetherTheUserIsAuthorized =>
      _saloonDetailsCustomerStore.whetherTheUserIsAuthorized;
  bool get isLoading => _saloonDetailsCustomerStore.isLoading;
  bool get isFavorite => _saloonDetailsCustomerStore.isFavorite;
  DateTime get dateTime => _saloonDetailsCustomerStore.dateTime;

  List<SaloonPhoto> get saloonPhotosList =>
      _saloonDetailsCustomerStore.saloonPhotosList;
  List<SocialNetwork> get socialNetworksList =>
      _saloonDetailsCustomerStore.socialNetworksList;
  List<SaloonSchedule> get saloonScheduleList =>
      _saloonDetailsCustomerStore.saloonScheduleList;
  List<SaloonMaster> get saloonMastersList =>
      _saloonDetailsCustomerStore.saloonMastersList;
  List<Window> get windowsList => _saloonDetailsCustomerStore.windowsList;
  List<Stock> get stocksList => _saloonDetailsCustomerStore.stocksList;
  List<Comment> get commentsList => _saloonDetailsCustomerStore.commentsList;

  Future<void> updateFavoriteSaloon() =>
      _saloonDetailsCustomerStore.updateFavoriteSaloon();

  @observable
  int itemCountComment = 0;

  @action
  void initItemCountComment() {
    if (commentsList.isEmpty) {
      itemCountComment = 0;
    } else if (commentsList.length <= 3) {
      itemCountComment = commentsList.length;
    } else {
      itemCountComment = 3;
    }
  }

  @action
  void setItemCountComment() {
    if (commentsList.length >= itemCountComment) {
      final difference = commentsList.length - itemCountComment;
      if (difference >= 5) {
        itemCountComment += 5;
      } else {
        itemCountComment += difference;
      }
    } else {
      return;
    }
  }

  void shareUrlSaloon() async {
    final title = saloonDetail.title;
    final saloonId = saloonDetail.id;
    const url = 'https://okoshki.net/salon/';
    await _shareRepository.opensTheSheetToShareTheText(
      text: 'Салон "$title" - $url$saloonId',
    );
  }

  Map<int, List<Window>> get windowsGroupSort {
    final group = groupBy(windowsList, (val) => val.startDateTime.day);
    return SplayTreeMap<int, List<Window>>.from(
        group, (keys1, keys2) => keys1.compareTo(keys2));
  }

  Future<void> openInBrowser(String path) async {
    _urlLauncherRepository.openInBrowser(path);
  }
}
