import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/domain/entities/extensions/client_blocking.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/dialogs/client_blocking/client_blocking_controller.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';

class ClientBlockingDialog extends StatelessWidget {
  const ClientBlockingDialog({super.key, required this.controller});
  final ClientBlockingController controller;
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
              'Увы, но забронировать услугу в этом салоне вам нельзя',
              textAlign: TextAlign.center,
              style: AppTextStyles.s18w600h262626,
            ),
            Observer(
              builder: (_) => controller.isLoading
                  ? const CircularLoadingWidget(isSaloon: false)
                  : Text(
                      'Блокировка будет снята\n${controller.clientBlocking?.dateBlocking ?? ''}',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.s16w400h262626,
                    ),
            ),
            const Divider(),
            TextButton(
              child: Text(
                'Понятно',
                style: AppTextStyles.s18w600h262626,
              ),
              onPressed: () => appRouter.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
