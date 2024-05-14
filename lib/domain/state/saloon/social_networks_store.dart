import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/social_network.dart';
import 'package:okoshki/domain/repository/api/social_networks_repository.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';

part 'social_networks_store.g.dart';

// ignore: library_private_types_in_public_api
class SocialNetworksSaloonStore = _SocialNetworksSaloonStore
    with _$SocialNetworksSaloonStore;

abstract class _SocialNetworksSaloonStore with Store {
  _SocialNetworksSaloonStore({
    required SocialNetworkRepository socialNetworkRepository,
    required SaloonStore saloonStore,
  })  : _socialNetworkRepository = socialNetworkRepository,
        _saloonStore = saloonStore;

  final SocialNetworkRepository _socialNetworkRepository;
  final SaloonStore _saloonStore;

  Future<void> init() async {
    await asyncWhen((_) => _saloonStore.isLoading == false);
    await _getSocialNetworksList();
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  @observable
  ObservableList<SocialNetwork> socialNetworksList = ObservableList();

  @action
  Future<void> _getSocialNetworksList() async {
    final res = await _socialNetworkRepository
        .getSocialNetworkList(_saloonStore.saloonId);

    if (res.success) {
      socialNetworksList.clear();
      socialNetworksList.addAll(res.data!);
      socialNetworksList.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  @action
  Future<void> updateSocialNetwork(
      {required List<SocialNetwork> editSocialNetworkList}) async {
    final List<SocialNetwork> updateList = [];

    for (var socialNetwork in editSocialNetworkList) {
      final res = await _socialNetworkRepository.updateSocialNetwork(
        socialId: socialNetwork.id,
        url: socialNetwork.url,
        isActive: socialNetwork.isActive,
      );

      if (res.success) {
        //update in list
        updateList.add(res.data!);
      }
    }
    for (var socialNetwork in updateList) {
      final index = socialNetworksList.indexWhere(
        (element) => element.id == socialNetwork.id,
      );
      socialNetworksList[index] = socialNetwork;
    }
  }
}
