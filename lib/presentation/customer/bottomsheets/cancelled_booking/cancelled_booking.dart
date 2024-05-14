import 'package:flutter/material.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';

class CancelledBookingBottomSheet extends StatelessWidget {
  const CancelledBookingBottomSheet({super.key});
  Future onPressedCancel() async {
    final appRouter = sl<AppRouter>();
    appRouter.pop(false);
  }

  Future onPressedConfirm() async {
    final appRouter = sl<AppRouter>();
    appRouter.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBottomSheet.customer(
      title: 'Снять бронь?',
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonCustomer.small(
              title: 'Отмена',
              onPressed: onPressedCancel,
            ),
            ButtonApp.small(
              title: 'Снять',
              onPressed: onPressedConfirm,
            ),
          ],
        ),
      ],
    );
  }
}
