import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okoshki/domain/entities/booking.dart';
import 'package:okoshki/domain/entities/extensions/booking.dart';
import 'package:okoshki/domain/entities/extensions/window_service.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/booking_status.dart';
import 'package:okoshki/presentation/app/widgets/icon_buton_circle.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';
import 'package:okoshki/presentation/app/widgets/preload/preload_list.dart';
import 'package:okoshki/presentation/app/widgets/saloon_card.dart';
import 'package:okoshki/presentation/customer/bottomsheets/booking_info_status/booking_info_status.dart';
import 'package:okoshki/presentation/customer/bottomsheets/booking_info_status/booking_info_status_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/filters_my_booking/filters_my_booking.dart';
import 'package:okoshki/presentation/customer/screens/my_bookings/my_booking_controller.dart';
import 'package:okoshki/presentation/customer/widgets/not_results.dart';
import 'package:okoshki/presentation/customer/widgets/preload/preload_booking_card.dart';

@RoutePage()
class MyBookingsCustomerScreen extends StatelessWidget {
  const MyBookingsCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<MyBookingsCustomerController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои брони'),
      ),
      floatingActionButton: Observer(
        builder: (_) => IconButtonCircle(
          isSaloon: false,
          icon: AppAssets.iconFilter,
          isBadge: controller.isFilters,
          onPressed: () async => showModalBottomSheet(
            isScrollControlled: true,
            useSafeArea: true,
            context: context,
            builder: (context) => const FiltersMyBookingBottomSheet(),
          ),
        ),
      ),
      body: const ViewScreen(),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<MyBookingsCustomerController>();
    return Observer(
      builder: (_) => controller.isLoading
          ? const PreloadListWidget(
              card: PreloadBookingCard(),
            )
          : const MyBookingsList(),
    );
  }
}

class MyBookingsList extends StatelessWidget {
  const MyBookingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final controller = sl<MyBookingsCustomerController>();
        final myBookingList = controller.myBookingsList.toList();
        return myBookingList.isEmpty
            ? const NotResultsWidget(
                title: 'Ни одной брони окошек ещё не выполнялось',
                subTitle:
                    'Бронь можно создать перейдя на экран любого салона или с главного экрана Okoshki',
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.only(right: 16, left: 16, bottom: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...controller.bookingGroupSort.entries.map(
                      (map) => _bookingList(map),
                    ),
                  ],
                ),
              );
      },
    );
  }

  Widget _bookingList(MapEntry<String, List<Booking>> map) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          map.key,
          style: AppTextStyles.s14w600h696969,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: map.value.length,
          itemBuilder: (_, index) {
            final booking = map.value[index];
            return BookingCard(booking: booking);
          },
        ),
      ],
    );
  }
}

class BookingCard extends StatelessWidget {
  const BookingCard({super.key, required this.booking});
  final Booking booking;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        final controllerBooking =
            sl<BookingInfoStatusController>(param1: booking);
        showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) =>
              BookingInfoStatusBottomSheet(controller: controllerBooking),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  booking.dateTimeBooking,
                  style: AppTextStyles.s14w400h696969,
                ),
              ),
              BookingStatusWidget(
                status: booking.status,
              ),
            ],
          ),
          SaloonCardWidget(
            logo: booking.salon.logo,
            isPremium: booking.salon.isPremium,
            title: booking.salon.title,
            address: booking.salon.address.toString(),
            rating: booking.salon.rating.toString(),
            usersLiked: booking.salon.usersLiked!.toInt(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    booking.titleService,
                    style: AppTextStyles.s14w400h262626,
                  ),
                ),
                Text(
                  booking.service.priceCurrency,
                  style: AppTextStyles.s16w600h262626,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: booking.service.master.avatar != null
                      ? ImageNetworkIndicator(
                          src: booking.service.master.avatar!,
                          height: 30,
                          width: 30,
                        )
                      : SvgPicture.asset(
                          AppAssets.avatarMaster,
                          height: 30,
                          width: 30,
                        ),
                ),
                const SizedBox(width: 8),
                Text(
                  booking.service.master.name,
                  style: AppTextStyles.s16w600h262626,
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
