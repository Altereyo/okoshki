
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/comment.dart';
import 'package:okoshki/domain/entities/extensions/date_time.dart';
import 'package:okoshki/domain/entities/saloon_detail.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';
import 'package:okoshki/domain/entities/saloon_photo.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';
import 'package:okoshki/domain/entities/social_network.dart';
import 'package:okoshki/domain/entities/stock.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/repository/api/comment_repository.dart';
import 'package:okoshki/domain/repository/api/saloon_master_repository.dart';
import 'package:okoshki/domain/repository/api/saloon_photo_repository.dart';
import 'package:okoshki/domain/repository/api/saloon_repository.dart';
import 'package:okoshki/domain/repository/api/saloon_schedule_repository.dart';
import 'package:okoshki/domain/repository/api/social_networks_repository.dart';
import 'package:okoshki/domain/repository/api/stock_repository.dart';
import 'package:okoshki/domain/repository/api/window_repository.dart';
import 'package:okoshki/domain/repository/services/geo_repository.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/domain/state/customer/favorite_saloons_store.dart';
import 'package:okoshki/internal/constants/status_window.dart';

part 'saloon_details_store.g.dart';

// ignore: library_private_types_in_public_api
class SaloonDetailsCustomerStore = _SaloonDetailsCustomerStore with _$SaloonDetailsCustomerStore;

abstract class _SaloonDetailsCustomerStore with Store {
  _SaloonDetailsCustomerStore({
    required int saloonId,
    required GeoRepository geoRepository,
    required LocalDataRepository localDataRepository,
    required SaloonRepository saloonRepository,
    required SaloonPhotoRepository saloonPhotoRepository,
    required SocialNetworkRepository socialNetworkRepository,
    required SaloonScheduleRepository saloonScheduleRepository,
    required SaloonMasterRepository saloonMasterRepository,
    required WindowRepository windowRepository,
    required FavoriteSaloonsCustomerStore favoriteSaloonsCustomerStore,
    required StockRepository stockRepository,
    required CommentRepository commentRepository,
  })  : _saloonId = saloonId,
        _geoRepository = geoRepository,
        _localDataRepository = localDataRepository,
        _saloonRepository = saloonRepository,
        _saloonPhotoRepository = saloonPhotoRepository,
        _socialNetworkRepository = socialNetworkRepository,
        _saloonScheduleRepository = saloonScheduleRepository,
        _saloonMasterRepository = saloonMasterRepository,
        _windowRepository = windowRepository,
        _favoriteSaloonsCustomerStore = favoriteSaloonsCustomerStore,
        _stockRepository = stockRepository,
        _commentRepository = commentRepository;

  final int _saloonId;
  final GeoRepository _geoRepository;
  final LocalDataRepository _localDataRepository;
  final SaloonRepository _saloonRepository;
  final SaloonPhotoRepository _saloonPhotoRepository;
  final SocialNetworkRepository _socialNetworkRepository;
  final SaloonScheduleRepository _saloonScheduleRepository;
  final SaloonMasterRepository _saloonMasterRepository;
  final WindowRepository _windowRepository;
  final FavoriteSaloonsCustomerStore _favoriteSaloonsCustomerStore;
  final StockRepository _stockRepository;
  final CommentRepository _commentRepository;

  List<SaloonPhoto> saloonPhotosList = [];
  late SaloonDetail saloonDetail;
  List<SocialNetwork> socialNetworksList = [];
  List<SaloonSchedule> saloonScheduleList = [];
  List<SaloonMaster> saloonMastersList = [];
  List<Window> windowsList = [];
  List<Stock> stocksList = [];
  List<Comment> commentsList = [];

  final dateTime = DateTime.now();

  Future<void> init() async {
    await _getSaloonPhotoList();
    await _getSaloonDetails();
    await _getSocialNetworkList();
    await _getSaloonScheduleList();
    await _getMasterList();
    await _getWindowsList();
    await _getStockList();
    await _getCommentsList();
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  @observable
  late bool isFavorite;


  bool get whetherTheUserIsAuthorized {
    if (_localDataRepository.getToken() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _getSaloonPhotoList() async {
    final res = await _saloonPhotoRepository.getPhotoList(
      saloonId: _saloonId,
    );

    if (res.success) {
      saloonPhotosList = res.data!;
    }
  }

  Future<void> _getSaloonDetails() async {
    final point = await _geoRepository.getPoint();
    final res = await _saloonRepository.getSaloonDetail(
      saloonId: _saloonId,
      point: point,
    );

    if (res.success) {
      saloonDetail = res.data!;
      isFavorite = saloonDetail.isFavorite!;
    }
  }

  Future<void> _getSocialNetworkList() async {
    final res = await _socialNetworkRepository.getSocialNetworkList(_saloonId);

    if (res.success) {
      socialNetworksList = res.data!;
    }
  }

  Future<void> _getSaloonScheduleList() async {
    final res = await _saloonScheduleRepository.getSaloonScheduleList(
      saloonId: _saloonId,
    );

    if (res.success) {
      saloonScheduleList = res.data!;
    }
  }

  Future<void> _getMasterList() async {
    final res = await _saloonMasterRepository.getMasterList(
      _saloonId,
    );

    if (res.success) {
      saloonMastersList = res.data!;
    }
  }

  Future<void> _getWindowsList() async {
    final res = await _windowRepository.getWindowList(
      saloonId: _saloonId,
      from: dateTime.toDay,
      to: dateTime.afterTomorrow,
      status: StatusWindowEnum.WAITING.name,
    );
    if (res.success) {
      windowsList = res.data!;
    }
  }

  Future<void> _getStockList() async {
    final res = await _stockRepository.getStockList(
      saloonId: _saloonId,
    );
    if (res.success) {
      stocksList = res.data!;
    }
  }

  Future<void> _getCommentsList() async {
    final res = await _commentRepository.getCommentList(
      saloonId: _saloonId,
    );
    if (res.success) {
      commentsList = res.data!;
    }
  }

  Future<void> updateFavoriteSaloon() async {
    await _favoriteSaloonsCustomerStore.updateFavoriteSaloon(
      favoriteSalonId: _saloonId,
    );
    isFavorite = !isFavorite;
  }

}
