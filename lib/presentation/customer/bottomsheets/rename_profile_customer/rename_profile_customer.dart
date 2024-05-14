import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/sub_title_sheet.dart';
import 'package:okoshki/presentation/customer/bottomsheets/rename_profile_customer/rename_profile_customer_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';

class RenameProfileCustomerBottomSheet extends StatelessWidget {
  const RenameProfileCustomerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<RenameProfileCustomerController>();
    final textEditingController = TextEditingController(
      text: controller.userProfile.username,
    );
    textEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.userProfile.username?.length ?? 0),
    );
    return LayoutBottomSheet.customer(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      title: 'Как вас зовут?',
      children: [
        const SubTitleSheet(
          subTitle:
              'Укажите своё имя, чтобы мастера знали как\nк вам обращаться',
        ),
        TextField(
          autofocus: true,
          controller: textEditingController,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(hintText: 'Введите своё имя'),
          onChanged: (val) => controller.userName = val,
        ),
        Observer(
          builder: (_) => ButtonCustomer.large(
            title: 'Сохранить',
            onPressed: controller.enabledButtonSaveName
                ? () async {
                    await controller.updateUserName();
                    if (context.mounted) {
                      appRouter.pop();
                    }
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
