import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/logo_okoski.dart';
import 'package:okoshki/presentation/saloon/screens/auth/auth_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/password_recovery/password_recovery.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/registration_saloon.dart/registration_saloon.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AuthSaloonScreen extends StatelessWidget {
  const AuthSaloonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<AuthSaloonController>();
    return Provider(
      create: (_) => controller,
      child: Scaffold(
        appBar: AppBar(),
        body: const ViewScreen(),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight! -
        32;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LogoOkoshki(path: AppAssets.logoSaloon),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextSalonEntrance(),
                FormEmailAndPassword(),
                ErrorText(),
                ButtonToComeIn(),
                TextButtonPasswordRecovery(),
              ],
            ),
            const ButtonApplicationForRegistration(),
          ],
        ),
      ),
    );
  }
}

class ErrorText extends StatelessWidget {
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthSaloonController>(context);
    return Observer(
      builder: (_) => controller.errorAuthorize.isEmpty
          ? Container()
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                controller.errorAuthorize,
                textAlign: TextAlign.center,
                style: AppTextStyles.s14w400hF64C4C,
              ),
            ),
    );
  }
}

class TextSalonEntrance extends StatelessWidget {
  const TextSalonEntrance({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Вход для салонов',
      style: AppTextStyles.s16w400h262626,
    );
  }
}

class FormEmailAndPassword extends StatelessWidget {
  const FormEmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthSaloonController>(context);
    return Observer(
      builder: (_) => Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Логин (email)',
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (email) {
              controller.email = email;
              controller.errorAuthorize = '';
            },
          ),
          TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => controller.isHidenPasswordView =
                      !controller.isHidenPasswordView,
                  icon: Icon(controller.isHidenPasswordView
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                hintText: 'Пароль',
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.isHidenPasswordView,
              onChanged: (pass) {
                controller.password = pass;
                controller.errorAuthorize = '';
              }),
        ],
      ),
    );
  }
}

class ButtonToComeIn extends StatelessWidget {
  const ButtonToComeIn({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<AuthSaloonController>(context);
    return Observer(
      builder: (_) => ButtonSaloon.large(
        title: 'Войти',
        onPressed: controller.isEnabledButtonToComeIn
            ? () async {
                await controller.authorize();

                if (controller.errorAuthorize.isEmpty) {
                  await controller.setIsSaloon();
                  appRouter.removeLast();

                  if (!controller.isIntroShown) {
                    appRouter.replaceNamed(PathRoute.introSaloonScreen);
                    return;
                  }
                  if (!controller.isSaloonSettingsPassed) {
                    appRouter.replaceNamed(
                      PathRoute.primarySettingSaloonScreen,
                    );
                    return;
                  }
                  appRouter.replaceNamed(PathRoute.homeSaloonScreen);
                }
              }
            : null,
      ),
    );
  }
}

class TextButtonPasswordRecovery extends StatelessWidget {
  const TextButtonPasswordRecovery({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (context) => const PasswordRecoveryBotomSheet(),
            ),
        child: Text(
          'Я не помню свой пароль',
          style: AppTextStyles.s16w600h385EO,
        ));
  }
}

class ButtonApplicationForRegistration extends StatelessWidget {
  const ButtonApplicationForRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonApp.large(
      title: 'Заявка на регистрацию',
      onPressed: () => showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (context) => const RegistrationSaloonBottomSheet(),
      ),
    );
  }
}
