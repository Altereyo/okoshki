
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/domain/entities/booking.dart';
import 'package:okoshki/domain/entities/extensions/booking.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/domain/entities/extensions/window_service.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/dialogs/alert_dialog.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/icon_app.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';
import 'package:okoshki/presentation/app/widgets/saloon_card.dart';
import 'package:okoshki/presentation/customer/bottomsheets/cancelled_booking/cancelled_booking.dart';
import 'package:okoshki/presentation/customer/bottomsheets/map_launcher/map_launcher.dart';
import 'package:okoshki/presentation/customer/bottomsheets/map_launcher/map_launcher_controller.dart';
import 'package:okoshki/presentation/customer/screens/booking_info/booking_info_controller.dart';
import 'package:okoshki/presentation/customer/widgets/timer_end_time.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class BookingInfoCustomerScreen extends StatelessWidget {
  const BookingInfoCustomerScreen({super.key, required this.controller});
  final BookingInfoCustomerController controller;

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    Future.delayed(
      Duration.zero,
      () => showAdaptiveDialog(
        context: context,
        builder: (context) {
          return const DialogApp.booking();
        },
      ),
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: IconButtonApp(
          path: AppAssets.iconCloseOutline,
          color: AppColors.hex696969,
          onPressed: () => appRouter.pop(),
        ),
        actions: [
          IconButtonApp(
            color: AppColors.hex696969,
            path: AppAssets.iconShare,
            onPressed: controller.shareBookingInfo,
          ),
        ],
      ),
      body: Provider(
        create: (_) => controller,
        child: const ViewScreen(),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleScreen(),
          QrCode(),
          SaloonWidgetBooking(),
          Divider(),
          InfoBooking(),
          ButtonCancelledBooking()
        ],
      ),
    );
  }
}

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookingInfoCustomerController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Column(
          children: [
            Text(
              'Всё получилось!',
              style: AppTextStyles.s26w600h262626,
            ),
            Text(
              'Услуга #${controller.booking.id} забронирована!',
              style: AppTextStyles.s18w400h262626,
            ),
          ],
        ),
      ),
    );
  }
}

class QrCode extends StatelessWidget {
  const QrCode({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookingInfoCustomerController>(context);
    // final logo = Provider.of<BookingInfoController>(context).booking.salon.logo;
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: QrImageView(
            data: controller.booking.uid,
            size: 220.0,
            gapless: false,
            version: QrVersions.auto,
            // embeddedImage: NetworkImage(logo!),
            // embeddedImageStyle: QrEmbeddedImageStyle(size: Size(60, 60)),
          ),
        ),
        // CircleAvatar(
        //   backgroundColor: AppColors.hexFFFFFF,
        //   radius: 30.0,
        //   child: logo != null
        //       ? CircleAvatar(
        //           foregroundImage: NetworkImage(logo),
        //           radius: 28,
        //         )
        //       : CircleAvatar(
        //           radius: 28,
        //           child: SvgPicture.asset(AppAssets.avatarSaloon),
        //         ),
        // ),
      ],
    );
  }
}

class SaloonWidgetBooking extends StatelessWidget {
  const SaloonWidgetBooking({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookingInfoCustomerController>(context);
    final saloon = controller.booking.salon;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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
            ),
          ),
          IconButtonApp(
            size: 24,
            path: AppAssets.iconWay,
            color: AppColors.hex43BCCE,
            onPressed: () {
              final recordSaloon = (
                title: controller.booking.salon.title,
                address: controller.booking.salon.address!,
              );
              final mapLauncherCustomerController =
                  sl<MapLauncherCustomerController>(
                param1: recordSaloon,
              );
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => MapLauncherSheet(
                  controller: mapLauncherCustomerController,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class InfoBooking extends StatelessWidget {
  const InfoBooking({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookingInfoCustomerController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                controller.booking.dateTimeStartEnd,
                style: AppTextStyles.s16w600h262626,
              ),
            ),
            IconButtonApp(
              size: 24,
              path: AppAssets.iconAddCalendar,
              color: AppColors.hex43BCCE,
              onPressed: controller.addingReservationToTheCalendar,
            ),
          ],
        ),
        TimerEndTime(
          endDateTime: controller.booking.window.startDateTime,
        ),
        Text(
          controller.booking.titleService,
          style: AppTextStyles.s16w600h262626,
        ),
        _master(controller.booking),
      ],
    );
  }

  Widget _master(Booking booking) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Специалист',
                  style: AppTextStyles.s14w400h696969,
                ),
              ),
              Expanded(
                child: Text(
                  'Стоимость услуги',
                  style: AppTextStyles.s14w400h696969,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: booking.service.master.avatar != null
                            ? ImageNetworkIndicator(
                                src: booking.service.master.avatar!,
                                height: 30,
                                width: 30,
                              )
                            : SvgPicture.asset(AppAssets.avatarMaster),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            booking.service.master.name,
                            style: AppTextStyles.s16w600h262626,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      booking.service.priceCurrency,
                      style: AppTextStyles.s16w600h262626,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonCancelledBooking extends StatelessWidget {
  const ButtonCancelledBooking({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<BookingInfoCustomerController>(context);
    return ButtonApp.large(
      title: 'Снять бронь',
      onPressed: () async {
        final bool? isRes = await showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) => const CancelledBookingBottomSheet(),
        );
        if (isRes == false) {
          return;
        }
        final isResult = await controller.updateBookingStatusCancelled();
        if (isResult && context.mounted) {
          appRouter.pop();
        }
      },
    );
  }
}
