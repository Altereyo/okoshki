import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_window/edit_window_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/window/select_day_time_window/select_day_time_window.dart';
import 'package:okoshki/presentation/saloon/widgets/window/select_window_service/select_window_service.dart';
import 'package:provider/provider.dart';

class EditWindowBottomSheet extends StatelessWidget {
  const EditWindowBottomSheet({super.key, required this.controller});
  final EditWindowController controller;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => controller,
      child: LayoutBottomSheet.saloon(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          MediaQuery.of(context).viewInsets.bottom,
        ),
        title: 'Изменить окошко',
        children: [
          SelectDayTimeWindow(
            controller: controller.selectDayTimeController,
          ),
          SelectWindowService(
            controller: controller.selectWindowServiceController,
          ),
          const CreateWindowButton(),
        ],
      ),
    );
  }
}

class CreateWindowButton extends StatelessWidget {
  const CreateWindowButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<EditWindowController>(context);
    return Observer(
      builder: (_) => ButtonSaloon.large(
        title: 'Сохранить изменения',
        onPressed: controller.isCompleteButton
            ? () async {
                final isResult = await controller.updateWindow();
                if (isResult && context.mounted) {
                  appRouter.pop();
                }
              }
            : null,
      ),
    );
  }
}
