import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/extensions/social_network.dart';
import 'package:okoshki/domain/entities/social_network.dart';
import 'package:okoshki/domain/repository/services/url_launcher_repository.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/customer/widgets/button_social_network.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_social_network/edit_social_network.dart';
import 'package:okoshki/presentation/saloon/widgets/button_text_icon.dart';
import 'package:okoshki/presentation/saloon/widgets/title_bloc_page_profile_info.dart';

class SocialNetworkWidget extends StatelessWidget {
  const SocialNetworkWidget({super.key, required this.socialNetworkList});
  final List<SocialNetwork> socialNetworkList;

  bool get _activeSocialNetworks => socialNetworkList.any(
        (element) => element.isActive == true,
      );

  @override
  Widget build(BuildContext context) {
    final urlLauncherRepository = sl<UrlLauncherRepository>();
    void onPressed() => showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) => const EditSocialNetworkBottomSheet(),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleBlocPageProfileInfo(
          title: 'Соцсети (необязательно)',
          subTitle: !_activeSocialNetworks ? 'Ничего не добавлено' : null,
        ),
        Row(children: [
          ...socialNetworkList.map(
            (socialNetwork) => socialNetwork.isActive
                ? ButtonSocialNetwork(
                    assetIcon: socialNetwork.icon,
                    onPressed: () => urlLauncherRepository.openInBrowser(
                      socialNetwork.url,
                    ),
                  )
                : Container(),
          ),
        ]),
        !_activeSocialNetworks
            ? ButtonTextIcon(
                title: 'Добавить соцсети',
                onPressed: onPressed,
              )
            : ButtonApp.large(
                title: 'Редактировать',
                onPressed: onPressed,
              ),
      ],
    );
  }
}
