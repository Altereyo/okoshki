import 'package:flutter/material.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';

class DeleteBottomSheet extends StatelessWidget {
  const DeleteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return LayoutBottomSheet.saloon(
      title: 'Удалить?',
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonSaloon.small(
              title: 'Отмена',
              onPressed: () async => appRouter.pop(false),
            ),
            ButtonApp.small(
              title: 'Удалить',
              onPressed: () => appRouter.pop(true),
            ),
          ],
        ),
      ],
    );
  }
}
