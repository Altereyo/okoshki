import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:group_button/group_button.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/balance_top_up/balance_top_up_controller.dart';

class BalanceTopUpBottomSheet extends StatefulWidget {
  const BalanceTopUpBottomSheet({super.key});

  @override
  State<BalanceTopUpBottomSheet> createState() =>
      _BalanceTopUpBottomSheetState();
}

class _BalanceTopUpBottomSheetState extends State<BalanceTopUpBottomSheet> {
  final controller = sl<BalanceTopUpController>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBottomSheet.saloon(
      title: 'Пополнение баланса',
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      children: [
        const TextFieldPrice(),
        ButtonPrice(),
        const TextBody(),
        const BottomButton(),
      ],
    );
  }
}

class TextFieldPrice extends StatelessWidget {
  const TextFieldPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<BalanceTopUpController>();
    return TextField(
      controller: controller.textEditingController,
      style: AppTextStyles.s26w600h262626,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        suffixText: '₽',
        suffixStyle: AppTextStyles.s26w600h262626,
        hintText: 'минимум 500 ₽',
        hintStyle: Theme.of(context).textTheme.bodyLarge!.merge(
              AppTextStyles.s26w400hC0C0C0,
            ),
      ),
      onChanged: (val) => controller.sum = val,
      onTap: () {
        controller.groupButtonController.unselectAll();
      },
    );
  }
}

class ButtonPrice extends StatelessWidget {
  ButtonPrice({super.key});
  final buttons = [
    '1000',
    '2000',
    '5000',
    '10000',
  ];
  @override
  Widget build(BuildContext context) {
    final controller = sl<BalanceTopUpController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GroupButton(
        options: AppGroupButtonOptions.saloon,
        controller: controller.groupButtonController,
        isRadio: true,
        buttons: buttons,
        onSelected: (_, index, __) {
          controller.button = index;
        },
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
        'Указанная сумма будет добавлена в счёт на оплату. Баланс обновится после подтверждения оплаты',
        style: AppTextStyles.s16w400h262626,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<BalanceTopUpController>();
    return Observer(
      builder: (_) => ButtonApp.large(
        title: 'Получить счёт',
        onPressed: controller.isEnabledButtonTopUp
            ? () async {
                await controller.topUpBalance();
                if (context.mounted) {
                  appRouter.pop();
                }
              }
            : null,
      ),
    );
  }
}
