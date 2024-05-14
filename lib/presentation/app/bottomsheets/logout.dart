import 'package:flutter/material.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key, required this.isSaloon});
  final bool isSaloon;
  Future onPressedCancel() async {
    final appRouter = sl<AppRouter>();
    appRouter.pop(false);
  }

  Future onPressedLogout() async {
    final appRouter = sl<AppRouter>();
    appRouter.pop(true);
  }
  @override
  Widget build(BuildContext context) {
    return isSaloon
        ? LayoutBottomSheet.saloon(
            title: 'Выйти из профиля',
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  isSaloon
                      ? ButtonSaloon.small(
                          title: 'Отмена',
                          onPressed: onPressedCancel,
                        )
                      : ButtonCustomer.small(
                          title: 'Отмена',
                          onPressed: onPressedCancel,
                        ),
                  ButtonApp.small(
                    title: 'Выйти',
                    onPressed: onPressedLogout,
                  ),
                ],
              ),
            ],
          )
        : LayoutBottomSheet.customer(
            title: 'Выйти из профиля',
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  isSaloon
                      ? ButtonSaloon.small(
                          title: 'Отмена',
                          onPressed: onPressedCancel,
                        )
                      : ButtonCustomer.small(
                          title: 'Отмена',
                          onPressed: onPressedCancel,
                        ),
                  ButtonApp.small(
                    title: 'Выйти',
                    onPressed: onPressedLogout,
                  ),
                ],
              ),
            ],
          );
  }
}
