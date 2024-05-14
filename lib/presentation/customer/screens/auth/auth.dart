import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/logo_okoski.dart';
import 'package:okoshki/presentation/customer/screens/auth/auth_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/code_confirmation/code_confirmation.dart';
import 'package:okoshki/presentation/customer/bottomsheets/code_confirmation/code_confirmation_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AuthCustomerScreen extends StatelessWidget {
  const AuthCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<AuthCustomerController>();
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
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<AuthCustomerController>(context);
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
            Column(
              children: [
                LogoOkoshki(path: AppAssets.logoCustomer),
                const TextMastersInYourCity(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextFirstOfAllLogIn(),
                const FormPhoneNumber(),
                Observer(
                  builder: (_) => ButtonCustomer.large(
                    title: 'Получить код',
                    onPressed: controller.isEnabledButtonGetCode
                        ? () async {
                            await controller.sendSms();
                            if (context.mounted) {
                              final codeConfirmationController =
                                  sl<CodeConfirmationController>(
                                param1: controller.phoneNumber,
                              );
                              showModalBottomSheet(
                                isScrollControlled: true,
                                useSafeArea: true,
                                context: context,
                                builder: (context) =>
                                    CodeConfirmationBottomSheet(
                                  controller: codeConfirmationController,
                                ),
                              );
                            }
                          }
                        : null,
                  ),
                ),
                const ButtonSkipAuthorization(),
              ],
            ),
            Column(
              children: [
                const TextPolicyAndConditions(),
                ButtonApp.large(
                  title: 'Вход для салонов',
                  onPressed: () =>
                      appRouter.pushNamed(PathRoute.authSaloonScreen),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextMastersInYourCity extends StatelessWidget {
  const TextMastersInYourCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        'Мастера в вашем городе\nвсегда под рукой',
        textAlign: TextAlign.center,
        style: AppTextStyles.s18w400h43BCCE,
      ),
    );
  }
}

class TextFirstOfAllLogIn extends StatelessWidget {
  const TextFirstOfAllLogIn({super.key});
  @override
  Widget build(BuildContext context) {
    return Text(
      'Для начала - авторизуйтесь',
      style: AppTextStyles.s16w400h262626,
    );
  }
}

class FormPhoneNumber extends StatefulWidget {
  const FormPhoneNumber({super.key});

  @override
  State<FormPhoneNumber> createState() => _FormPhoneNumberState();
}

class _FormPhoneNumberState extends State<FormPhoneNumber> {
  final _maskFormater = MaskTextInputFormatter(
    mask: '(###) ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthCustomerController>(context);
    return IntrinsicWidth(
      child: TextField(
        style: AppTextStyles.s26w600h262626,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.58,
              child: Text(
                '+7',
                style: AppTextStyles.s26w400h262626,
              )),
          prefixStyle: AppTextStyles.s26w400h262626,
          hintText: '(999) 999 99 99 ',
          hintStyle: Theme.of(context).textTheme.bodyLarge!.merge(
                AppTextStyles.s26w400hC0C0C0,
              ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [_maskFormater],
        onChanged: (val) =>
            controller.phoneNumber = '8${_maskFormater.getUnmaskedText()}',
      ),
    );
  }
}

class ButtonSkipAuthorization extends StatelessWidget {
  const ButtonSkipAuthorization({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<AuthCustomerController>(context);
    return TextButton(
      onPressed: () {
        if (controller.isIntroShown) {
          appRouter.replaceNamed(PathRoute.homeCustomerScreen);
        } else {
          appRouter.replaceNamed(PathRoute.introCustomerScreen);
        }
      },
      child: Text(
        'Пропустить авторизацию',
        style: AppTextStyles.s16w600h43BCCE,
      ),
    );
  }
}

class TextPolicyAndConditions extends StatelessWidget {
  const TextPolicyAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        children: [
          Text(
            'Продолжая авторизацию, вы соглашаетесь',
            style: AppTextStyles.s14w400h696969,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('c ', style: AppTextStyles.s14w400h696969),
              InkWell(
                onTap: () => appRouter.pushNamed(PathRoute.privacyPolicyScreen),
                child: Text(
                  'политикой конфиденциальности',
                  style: AppTextStyles.s14w400h43BCCE,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'и ',
                style: AppTextStyles.s14w400h696969,
              ),
              InkWell(
                onTap: () =>
                    appRouter.pushNamed(PathRoute.termsOfServiceScreen),
                child: Text(
                  'условиями сервиса',
                  style: AppTextStyles.s14w400h43BCCE,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
