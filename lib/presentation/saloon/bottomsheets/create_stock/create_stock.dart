import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/create_stock/create_stock_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/add_logo_button.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/text_field_bloc.dart';

class CreateStockBottomSheet extends StatefulWidget {
  const CreateStockBottomSheet({super.key});

  @override
  State<CreateStockBottomSheet> createState() => _CreateStockBottomSheetState();
}

class _CreateStockBottomSheetState extends State<CreateStockBottomSheet> {
  final controller = sl<CreateStockController>();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return LayoutBottomSheet.saloon(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      title: 'Добавить акцию',
      children: [
        TextFieldBloc(
          titleBloc: 'Название',
          text: controller.title,
          hintText: 'Укажите название акции',
          onChanged: (title) => controller.title = title,
        ),
        const SizedBox(height: 8),
        TextFieldBloc(
          titleBloc: 'Срок акции',
          text: controller.duration,
          hintText: 'Укажите сроки акции',
          onChanged: (duration) => controller.duration = duration,
        ),
        AddLogoButton.square(
          logo: controller.logo,
          onPatchLogo: (pathLogo) => controller.logo = pathLogo,
        ),
        const Divider(),
        const SizedBox(height: 8),
        TextFieldBloc(
          titleBloc: 'Описание акции (необязательно)',
          text: controller.description,
          hintText: 'Напишите подробнее об акции',
          onChanged: (description) => controller.description = description,
        ),
        const SizedBox(height: 8),
        Observer(
          builder: (_) => ButtonSaloon.large(
            title: 'Подтвердить',
            onPressed: controller.isEnabledButtonCreate
                ? () async {
                    final isResult = await controller.createStock();

                    if (isResult && context.mounted) {
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
