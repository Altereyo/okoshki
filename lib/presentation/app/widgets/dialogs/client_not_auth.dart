import 'package:flutter/material.dart';
import 'package:okoshki/internal/functions/reset_dependencies.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';

class ClientNotAuthDialog extends StatelessWidget {
  final String title;
  const ClientNotAuthDialog.booking({super.key})
      : title = 'Для бронирование услуги необходимо авторизоваться в сервисе';
  const ClientNotAuthDialog.comment({super.key})
      : title = 'Для добавления отзыва необходимо авторизоваться в сервисе';
  const ClientNotAuthDialog.favorite({super.key})
      : title = 'Для добавления в избранное необходимо авторизоваться в сервисе';
  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return AlertDialog(
      surfaceTintColor: AppColors.hexFFFFFF,
      backgroundColor: AppColors.hexFFFFFF,
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.s18w600h262626,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text(
                    'Отменить',
                    style: AppTextStyles.s18w600h262626,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    'Войти',
                    style: AppTextStyles.s18w600h262626,
                  ),
                  onPressed: () {
                    appRouter.popUntilRoot();
                    appRouter.replaceNamed(PathRoute.authCustomerScreen);
                    resetLazyDependencies();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
