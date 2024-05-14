import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/extensions/social_network.dart';
import 'package:okoshki/domain/entities/social_network.dart';
import 'package:okoshki/domain/state/saloon/social_networks_store.dart';

part 'edit_social_network_controller.g.dart';

// ignore: library_private_types_in_public_api
class EditSocialNetworkController = _EditSocialNetworkController
    with _$EditSocialNetworkController;

abstract class _EditSocialNetworkController with Store {
  _EditSocialNetworkController({
    required SocialNetworksSaloonStore socialNetworksSaloonStore,
  }) : _socialNetworksSaloonStore = socialNetworksSaloonStore;
  final SocialNetworksSaloonStore _socialNetworksSaloonStore;

  Future<void> init() async {
    //Создание копии листа
    for (var element in _socialNetworksSaloonStore.socialNetworksList) {
      editSocialNetworkList.add(element.copyWith());
    }
  }

  //Редактируемый список
  @observable
  ObservableList<SocialNetwork> editSocialNetworkList = ObservableList();

  Future<void> updateSocialNetwork() async {
    final List<SocialNetwork> socialNetworkList = [];
    for (var socialNetwork in editSocialNetworkList) {
      //Если редактируемого экземпляра нет то обновить данные
      final res = _socialNetworksSaloonStore.socialNetworksList.where(
        (element) =>
            element.id == socialNetwork.id &&
            element.isActive == socialNetwork.isActive &&
            element.url == socialNetwork.url,
      );
      if (res.isEmpty) {
        socialNetworkList.add(socialNetwork);
      }
    }
    await _socialNetworksSaloonStore.updateSocialNetwork(
        editSocialNetworkList: socialNetworkList);
  }
}
