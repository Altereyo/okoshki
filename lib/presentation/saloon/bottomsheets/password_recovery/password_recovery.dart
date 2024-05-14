import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/password_recovery/password_recovery_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:provider/provider.dart';

class PasswordRecoveryBotomSheet extends StatelessWidget {
  const PasswordRecoveryBotomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<PasswordRecoveryController>();
    return Provider(
      create: (_) => controller,
      child: LayoutBottomSheet.saloon(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          MediaQuery.of(context).viewInsets.bottom,
        ),
        title: 'Восстановление пароля',
        children: const [
          TextenterYourEmail(),
          FormEmail(),
          ButtonPasswordRecovery(),
        ],
      ),
    );
  }
}

class TextenterYourEmail extends StatelessWidget {
  const TextenterYourEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Укажи email, который был указан\nпри регистрации в сервисе',
        textAlign: TextAlign.center,
        style: AppTextStyles.s16w400h262626,
      ),
    );
  }
}

class FormEmail extends StatelessWidget {
  const FormEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PasswordRecoveryController>(context);
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Адрес email',
            errorText: controller.errorEmailRecovery,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) => controller.emailRecovery = email,
        ),
      ),
    );
  }
}

class ButtonPasswordRecovery extends StatelessWidget {
  const ButtonPasswordRecovery({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<PasswordRecoveryController>(context);
    return Observer(
      builder: (_) => ButtonSaloon.large(
        title: 'Восстановить пароль',
        onPressed: controller.isEnabledButtonRecovery
            ? () async {
                await controller.passwordRecovery();
                if (context.mounted) {
                  appRouter.pop();
                }
              }
            : null,
      ),
    );
  }
}
