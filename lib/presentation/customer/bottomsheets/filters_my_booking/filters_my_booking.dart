import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_button/group_button.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/customer/bottomsheets/filters_my_booking/filters_my_booking_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';

class FiltersMyBookingBottomSheet extends StatelessWidget {
  const FiltersMyBookingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBottomSheet.customer(
      title: 'Фильтры',
      children: const [
        FilterDate(),
        FilterReview(),
        BottomButtons(),
      ],
    );
  }
}

class FilterDate extends StatelessWidget {
  const FilterDate({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<FiltersMyBookingController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GroupButton(
        controller: controller.buttonDateController,
        options: AppGroupButtonOptions.customer,
        buttons: const [
          'За всё время',
          'В этом месяце',
          'Последние 3 месяца',
          'Последние подгода',
        ],
        onSelected: (_, int index, __) => controller.dateButton = index,
      ),
    );
  }
}

class FilterReview extends StatelessWidget {
  const FilterReview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<FiltersMyBookingController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Observer(
            builder: (_) => InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => controller.isNotReview = !controller.isNotReview,
              child: controller.isNotReview
                  ? SvgPicture.asset(AppAssets.iconCheckboxActive)
                  : SvgPicture.asset(AppAssets.iconCheckboxNotActive),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Показать брони без ваших отзывов',
            style: AppTextStyles.s14w600h262626,
          )
        ],
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<FiltersMyBookingController>();
    return Observer(
      builder: (_) => controller.isResetButton
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonApp.small(
                  title: 'Сбросить',
                  onPressed: controller.onTapResetFilters,
                ),
                ButtonCustomer.small(
                  title: 'Применить',
                  onPressed: () async {
                    await controller.applyFilters();
                    if (context.mounted) {
                      appRouter.pop();
                    }
                  },
                ),
              ],
            )
          : ButtonCustomer.large(
              title: 'Применить',
              onPressed: () async {
                await controller.applyFilters();
                if (context.mounted) {
                  appRouter.pop();
                }
              },
            ),
    );
  }
}
