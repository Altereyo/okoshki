import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/dialogs/client_blocking/client_blocking.dart';
import 'package:okoshki/presentation/app/widgets/dialogs/client_blocking/client_blocking_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/booking_form/booking_form.dart';
import 'package:okoshki/presentation/customer/bottomsheets/booking_form/booking_form_controller.dart';

class WindowsListWidget extends StatelessWidget {
  const WindowsListWidget({
    super.key,
    required this.windows,
    required this.isPremium,
    required this.saloonId,
    required this.isBlocking,
  });
  final List<Window> windows;
  final int saloonId;
  final bool isPremium;
  final bool isBlocking;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        height: 48,
        child: ListView.builder(
          itemCount: windows.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final window = windows[index];
            return WindowCustomerCard(
              window: window,
              saloonId: saloonId,
              isPremium: isPremium,
              isBlocking: isBlocking,
            );
          },
        ),
      ),
    );
  }
}

class WindowCustomerCard extends StatelessWidget {
  const WindowCustomerCard({
    super.key,
    required this.window,
    required this.saloonId,
    required this.isPremium,
    required this.isBlocking,
  });
  final Window window;
  final int saloonId;
  final bool isPremium;
  final bool isBlocking;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          //Если салон заблокирован у клиента
          if (isBlocking) {
            final clientBlockingController = sl<ClientBlockingController>(
              param1: saloonId,
            );
            showAdaptiveDialog(
              context: context,
              builder: (context) {
                return ClientBlockingDialog(
                  controller: clientBlockingController,
                );
              },
            );
            return;
          }
          //Переход на бронирование услуги
          final bookingFormController = sl<BookingFormController>(
            param1: saloonId,
            param2: window.id,
          );
          showModalBottomSheet(
            isScrollControlled: true,
            useSafeArea: true,
            context: context,
            builder: (context) => BookingFormBottomSheet(
              controller: bookingFormController,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isPremium ? AppColors.hexDF49B5 : AppColors.hex43BCCE,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    window.timeWindow,
                    style: AppTextStyles.s16w700hFFFFFF,
                  ),
                ),
                Text(
                  window.minPriceWindow ?? '',
                  style: AppTextStyles.s12w400hFFFFFF,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
