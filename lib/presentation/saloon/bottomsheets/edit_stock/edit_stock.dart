import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/domain/entities/stock.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_stock/edit_stock_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/add_logo_button.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/text_field_bloc.dart';

class EditStockBottomSheet extends StatefulWidget {
  const EditStockBottomSheet({super.key, required this.stock});
  final Stock stock;

  @override
  State<EditStockBottomSheet> createState() => _EditStockBottomSheetState();
}

class _EditStockBottomSheetState extends State<EditStockBottomSheet> {
  late EditStockController controller;

  @override
  void initState() {
    controller = sl<EditStockController>(param1: widget.stock);
    super.initState();
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
      title: 'Изменить акцию',
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
            title: 'Сохранить',
            onPressed: controller.isEnabledButtonEdit
                ? () async {
                    final isResult = await controller.updateStock();

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
