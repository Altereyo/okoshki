import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/current_window.dart';
import 'package:okoshki/domain/entities/extensions/date_time.dart';
import 'package:okoshki/domain/entities/extensions/saloon.dart';
import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/dialogs/client_blocking/client_blocking.dart';
import 'package:okoshki/presentation/app/widgets/dialogs/client_blocking/client_blocking_controller.dart';
import 'package:okoshki/presentation/app/widgets/saloon_card.dart';
import 'package:okoshki/presentation/customer/bottomsheets/booking_form/booking_form.dart';
import 'package:okoshki/presentation/customer/bottomsheets/booking_form/booking_form_controller.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';
import 'package:validators2/sanitizers.dart';

class SaloonAndWindowCardWidget extends StatelessWidget {
  const SaloonAndWindowCardWidget({super.key, required this.saloon});
  final Saloon saloon;
  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            final saloonDetailsCustomerController =
                sl<SaloonDetailsCustomerController>(
              param1: saloon.id,
            );
            appRouter.push(
              SaloonDetailsCustomerRoute(
                controller: saloonDetailsCustomerController,
              ),
            );
          },
          child: Row(
            children: [
              Expanded(
                child: SaloonCardWidget(
                  logo: saloon.logo,
                  isPremium: saloon.isPremium,
                  title: saloon.title,
                  address: saloon.address.toString(),
                  rating: saloon.rating.toString(),
                  usersLiked: saloon.usersLiked!.toInt(),
                  distance: saloon.distanceToString,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.hex43BCCE,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: saloon.currentWindows!.isEmpty
              ? Text(
                  'Нет свободных окошек',
                  style: AppTextStyles.s16w400h696969,
                )
              : SizedBox(
                  height: 65,
                  child: ListView.builder(
                    itemCount: saloon.currentWindows!.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final window = saloon.currentWindows![index];
                      return CurrentWindowCard(
                        currentWindow: window,
                        saloonId: saloon.id,
                        isPremium: saloon.isPremium,
                        isBlocking: saloon.salonBlocking ?? false,
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}

class CurrentWindowCard extends StatelessWidget {
  const CurrentWindowCard({
    super.key,
    required this.currentWindow,
    required this.saloonId,
    required this.isPremium,
    required this.isBlocking,
  });
  final CurrentWindow currentWindow;
  final int saloonId;
  final bool isPremium;
  final bool isBlocking;

  String get timeWindow => '${DateFormat('HH:mm').format(
        DateTime.parse(currentWindow.startDt).toLocal(),
      )} - ${DateFormat('HH:mm').format(
        DateTime.parse(currentWindow.endDt).toLocal(),
      )}';

  String? get priceMin {
    final listPrice = currentWindow.services
        .map(
          (e) => toDouble(e.price),
        )
        .toList();
    return 'от ${listPrice.reduce(min)} ₽';
  }

  String get date {
    final startDateTime = DateTime.parse(currentWindow.startDt).toLocal();
    if (startDateTime.isToday) {
      return 'Сегодня';
    } else if (startDateTime.isTomorrow) {
      return 'Завтра';
    } else if (startDateTime.isAfterTomorrow) {
      return 'Послезавтра';
    }
    return 'null';
  }

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
            param2: currentWindow.id,
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
                Text(
                  date,
                  style: AppTextStyles.s12w400hFFFFFF,
                ),
                Center(
                  child: Text(
                    timeWindow,
                    style: AppTextStyles.s16w700hFFFFFF,
                  ),
                ),
                Text(
                  priceMin ?? '',
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
