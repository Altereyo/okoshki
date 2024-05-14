import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:okoshki/domain/entities/saloon_photo.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/dialogs/client_not_auth.dart';
import 'package:okoshki/presentation/app/widgets/icon_app.dart';
import 'package:okoshki/presentation/app/widgets/icon_logo_okoshki.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_favorite.dart';
import 'package:provider/provider.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    return SliverLayoutBuilder(
      builder: (context, sliverConstraints) {
        final scroll = sliverConstraints.scrollOffset;
        return SliverAppBar(
          title: Text(
            controller.saloonDetail.title!,
            style: scroll > 200
                ? AppTextStyles.s16w600h262626
                : AppTextStyles.s18w600hFFFFFFt0,
          ),
          iconTheme: IconThemeData(
            color: scroll > 220 ? AppColors.hex696969 : AppColors.hexFFFFFF,
          ),
          actions: [
            scroll > 200
                ? Observer(
                    builder: (_) => ButtonFavorite(
                      isValue: controller.isFavorite,
                      onPressed: () async {
                        final isAuthorized =
                            controller.whetherTheUserIsAuthorized;
                        if (isAuthorized) {
                          await controller.updateFavoriteSaloon();
                        } else {
                          showAdaptiveDialog(
                            context: context,
                            builder: (context) {
                              return const ClientNotAuthDialog.favorite();
                            },
                          );
                          return;
                        }
                      },
                    ),
                  )
                : Container(),
            IconButtonApp(
              color: scroll > 200 ? AppColors.hex696969 : AppColors.hexFFFFFF,
              path: AppAssets.iconShare,
              onPressed: controller.shareUrlSaloon,
            ),
          ],
          expandedHeight: 280,
          floating: false,
          pinned: true,
          snap: false,
          flexibleSpace: FlexibleSpaceBarWidget(
            scroll: scroll,
          ),
        );
      },
    );
  }
}

class FlexibleSpaceBarWidget extends StatelessWidget {
  const FlexibleSpaceBarWidget({super.key, required this.scroll});
  final double scroll;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        FlexibleSpaceBar(
          background: controller.saloonPhotosList.isEmpty
              ? _stub()
              : _slidePhoto(controller.saloonPhotosList),
        ),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.hexFFFFFF,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
            scroll < 200
                ? Observer(
                    builder: (_) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: RawMaterialButton(
                        elevation: 0.5,
                        onPressed: () {},
                        fillColor: AppColors.hexFFFFFF,
                        padding: const EdgeInsets.all(12.0),
                        shape: const CircleBorder(),
                        child: ButtonFavorite(
                          isValue: controller.isFavorite,
                          onPressed: () async {
                            final isAuthorized =
                                controller.whetherTheUserIsAuthorized;
                            if (isAuthorized) {
                              await controller.updateFavoriteSaloon();
                            } else {
                              showAdaptiveDialog(
                                context: context,
                                builder: (context) {
                                  return const ClientNotAuthDialog.favorite();
                                },
                              );
                              return;
                            }
                          },
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }

  Widget _stub() {
    return Container(
      color: AppColors.hex43BCCE,
      child: Center(
        child: IconLogoOkoshki.white(),
      ),
    );
  }

  Widget _slidePhoto(List<SaloonPhoto> saloonPhotosList) {
    return IntroductionScreen(
      freeze: false,
      //autoScrollDuration: 2000,
      rawPages: saloonPhotosList
          .map(
            (e) => Image.network(
              e.image,
              fit: BoxFit.cover,
            ),
          )
          .toList(),
      showNextButton: false,
      showDoneButton: false,
      dotsDecorator: DotsDecorator(
        size: const Size.square(8.0),
        color: AppColors.hexFFFFFF,
        activeColor: AppColors.hex43BCCE,
        spacing: const EdgeInsets.only(bottom: 30, left: 4, right: 4),
      ),
    );
  }
}
