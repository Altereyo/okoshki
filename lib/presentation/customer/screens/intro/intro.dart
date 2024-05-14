import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/app/widgets/view_intro_slide.dart';
import 'package:okoshki/presentation/customer/screens/intro/intro_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';

final _introKey = GlobalKey<IntroductionScreenState>();

@RoutePage()
class IntroCustomerScreen extends StatelessWidget {
  const IntroCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<IntroCustomerController>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Observer(
            builder: (_) => controller.indexPage >=
                    controller.introSlidesCustomerList.length - 1
                ? Container()
                : TextButton(
                    onPressed: () async {
                      await controller.setLocalDataRepository();
                      appRouter.replaceNamed(PathRoute.homeCustomerScreen);
                    },
                    child: Text(
                      'Пропустить',
                      style: AppTextStyles.s14w600h696969,
                    ),
                  ),
          )
        ],
      ),
      body: Observer(
        builder: (_) => controller.isLoading
            ? const CircularLoadingWidget(
                isSaloon: false,
              )
            : const ViewScreen(),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = sl<IntroCustomerController>();
    return Column(
      children: [
        Expanded(
          child: IntroductionScreen(
            onChange: (val) => controller.setIndex(val),
            key: _introKey,
            rawPages: controller.introSlidesCustomerList
                .map((introSlide) => ViewIntroSlide(
                      pathImage: introSlide.slide,
                      title: introSlide.title,
                      subTitle: introSlide.text,
                    ))
                .toList(),
            showNextButton: false,
            showDoneButton: false,
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: AppColors.hex43BCCE,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ),
        const ButtonNavigation(),
      ],
    );
  }
}

class ButtonNavigation extends StatelessWidget {
  const ButtonNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<IntroCustomerController>();
    return Observer(
      builder: (_) =>
          controller.indexPage >= controller.introSlidesCustomerList.length - 1
              ? ButtonCustomer.small(
                  title: 'Ну, вперёд!',
                  onPressed: () async {
                    await controller.setLocalDataRepository();
                    appRouter.replaceNamed(PathRoute.homeCustomerScreen);
                  },
                )
              : ButtonCustomer.small(
                  title: 'Далее',
                  onPressed: () async => _introKey.currentState!.next(),
                ),
    );
  }
}
