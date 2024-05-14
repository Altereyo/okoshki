import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:group_button/group_button.dart';
import 'package:okoshki/domain/entities/extensions/premium_tariff.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/premium_connect/premium_connect_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';

class PremiumConnectBottomSheet extends StatelessWidget {
  PremiumConnectBottomSheet({super.key});
  final controller = sl<PremiumConnectController>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => controller.isLoading
          ? const SizedBox(
              height: 100,
              child: CircularLoadingWidget(isSaloon: true),
            )
          : LayoutBottomSheet.saloon(
              title: controller.premium != null
                  ? 'Продлить\nPremium-статус'
                  : 'Подключить\nPremium-статус',
              children: [
                ButtonPeriod(),
                const TextPrice(),
                const Divider(),
                const TextBody(),
                const BottomButtons(),
              ],
            ),
    );
  }
}

class ButtonPeriod extends StatelessWidget {
  ButtonPeriod({super.key});
  final buttons = [
    '1 месяц',
    '3 месяца',
    '6 месяцев',
  ];
  @override
  Widget build(BuildContext context) {
    final controller = sl<PremiumConnectController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'На какой период',
            style: AppTextStyles.s14w600h696969,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GroupButton(
            options: AppGroupButtonOptions.saloon,
            controller: controller.groupButtonController,
            isRadio: true,
            buttons: buttons,
            onSelected: (_, index, __) {
              controller.monthButton = index;
            },
          ),
        ),
      ],
    );
  }
}

class TextPrice extends StatelessWidget {
  const TextPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<PremiumConnectController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Observer(
        builder: (_) => RichText(
          text: TextSpan(
            text: 'Стоимость: ',
            style: AppTextStyles.s16w400h262626,
            children: [
              TextSpan(
                text: controller.selectPremiumTariff!.priceCurrency,
                style: AppTextStyles.s16w600h262626,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextBody extends StatelessWidget {
  const TextBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      child: Text(
        'После подключения статуса Premium с баланса будет списана стоимость за выбранный период',
        style: AppTextStyles.s16w400h262626,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<PremiumConnectController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonApp.small(
          title: 'Отменить',
          onPressed: () {
            appRouter.pop();
          },
        ),
        ButtonSaloon.small(
          title: 'Подтвердить',
          onPressed: () async {
            final result = await controller.apply();
            if (!result) {
              return;
            }
            if (context.mounted) {
              appRouter.pop();
            }
          },
        ),
      ],
    );
  }
}
