import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/booking_window.dart';
import 'package:okoshki/domain/entities/extensions/booking_window.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/domain/entities/extensions/window_service.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/entities/window_service.dart';
import 'package:okoshki/internal/constants/status_booking.dart';
import 'package:okoshki/internal/constants/status_window.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';
import 'package:okoshki/presentation/app/widgets/window_status.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/window_detail/window_detail.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/window_detail/window_detail_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_service_number.dart';
import 'package:provider/provider.dart';

class WindowCard extends StatelessWidget {
  const WindowCard({super.key, required this.window, required this.isTime});
  final Window window;
  final bool isTime; //21:00  - 22:00 || 22 окт 2022  15:00 - 16:00

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => window,
      child: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                final controllerWindow =
                    sl<WindowDetailController>(param1: window);
                showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) => WindowDetailBottomSheet(
                    controller: controllerWindow,
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _timeStatus(),
                  _bodyWindow(),
                ],
              ),
            ),
            const Divider(),
          ],
        );
      }),
    );
  }

  Widget _bodyWindow() {
    if (StatusWindowEnum.WAITING.name == window.status! ||
        StatusWindowEnum.WAS_NOT_BOOKING.name == window.status! ||
        StatusWindowEnum.CANCELLED.name == window.status!) {
      return ActiveWindow(window: window);
    }
    if (StatusWindowEnum.BOOKING.name == window.status!) {
      final bookingWindow = window.bookingsWindow!.firstWhere(
        (element) => element.status == StatusBookingEnum.ACTIVE.name,
      );
      return NotActiveWindow(bookingWindow: bookingWindow, window: window);
    }
    if (StatusWindowEnum.CLIENT_NOT_COME.name == window.status!) {
      final bookingWindow = window.bookingsWindow!.firstWhere(
        (element) => element.status == StatusBookingEnum.CLIENT_NOT_COME.name,
      );
      return NotActiveWindow(bookingWindow: bookingWindow, window: window);
    }
    if (StatusWindowEnum.DONE.name == window.status!) {
      final bookingWindow = window.bookingsWindow!.firstWhere(
        (element) => element.status == StatusBookingEnum.SERVICE_RENDERED.name,
      );
      return NotActiveWindow(bookingWindow: bookingWindow, window: window);
    }
    if (StatusWindowEnum.CLIENT_CANCELLED.name == window.status!) {
      final bookingWindow = window.bookingsWindow!.firstWhere(
        (element) => element.status == StatusBookingEnum.CLIENT_CANCELLED.name,
      );
      return NotActiveWindow(bookingWindow: bookingWindow, window: window);
    }
    return const Placeholder();
  }

  Widget _timeStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isTime
            ? Text(
                window.timeWindow,
                style: AppTextStyles.s18w600h262626,
              )
            : Row(
                children: [
                  Text(
                    DateFormat.yMd().format(window.startDateTime),
                    style: AppTextStyles.s14w600h262626,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    window.timeWindow,
                    style: AppTextStyles.s14w400h262626,
                  )
                ],
              ),
        WindowStatusWidget(
          status: window.status!,
        ),
      ],
    );
  }
}

//Статус окошка Ждёт брони / Не было броней / Отменено
class ActiveWindow extends StatelessWidget {
  const ActiveWindow({super.key, required this.window});
  final Window window;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _services(window),
        _masters(window),
      ],
    );
  }

  Widget _services(Window window) {
    return SizedBox(
      height: 46,
      child: window.services.length == 1
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  window.services.first.service.serviceType.title,
                  style: AppTextStyles.s16w600h262626,
                ),
                Text(
                  window.services.first.service.title,
                  style: AppTextStyles.s14w400h696969,
                ),
              ],
            )
          : ListView.builder(
              itemCount: window.servicesTypeWindow().length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final serType = window.servicesTypeWindow()[index];

                return ButtonServiceNumber(
                  title: serType.title,
                  number: window.countServicesTypeWindow(serType),
                );
              },
            ),
    );
  }

  Widget _masters(Window window) {
    final mastersList = window.mastersWindow();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          mastersList.length == 1
              ? Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: mastersList.first.avatar != null
                          ? ImageNetworkIndicator(
                              src: mastersList.first.avatar!,
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
                      mastersList.first.name,
                      style: AppTextStyles.s16w600h262626,
                    ),
                  ],
                )
              : FlutterImageStack.widgets(
                  itemCount: 3,
                  totalCount: mastersList.length,
                  itemRadius: 30,
                  itemBorderWidth: 1,
                  itemBorderColor: AppColors.hexFFFFFF,
                  children: [
                    ...mastersList.map(
                      (master) => ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: master.avatar != null
                            ? ImageNetworkIndicator(
                                src: master.avatar!,
                                height: 30,
                                width: 30,
                              )
                            : SvgPicture.asset(
                                AppAssets.avatarMaster,
                                height: 30,
                                width: 30,
                              ),
                      ),
                    ),
                  ],
                ),
          Text(
            window.minMaxPriceWindow,
            style: AppTextStyles.s16w600h262626,
          ),
        ],
      ),
    );
  }
}

//Статус окошка Есть бронь / Клиент не пришел / Выполнено / Отменено клиентом
class NotActiveWindow extends StatelessWidget {
  const NotActiveWindow(
      {super.key, required this.bookingWindow, required this.window});
  final BookingWindow bookingWindow;
  final Window window;
  @override
  Widget build(BuildContext context) {
    final windowService = window.services.firstWhere(
      (element) => element.id == bookingWindow.windowServiceId,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _service(window, windowService),
        _masters(window, windowService),
      ],
    );
  }

  Widget _service(Window window, WindowService windowService) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          windowService.service.serviceType.title,
          style: AppTextStyles.s16w600h262626,
        ),
        Text(
          window.services.first.service.title,
          style: AppTextStyles.s14w400h696969,
        ),
      ],
    );
  }

  Widget _masters(Window window, WindowService windowService) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: windowService.master.avatar != null
                    ? ImageNetworkIndicator(
                        src: windowService.master.avatar!,
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
                windowService.master.name,
                style: AppTextStyles.s16w600h262626,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                windowService.priceCurrency,
                style: _textStyle(window.status!),
              ),
              bookingWindow.commissionAmount == null
                  ? Container()
                  : Text(
                      bookingWindow.titleCommision,
                      style: AppTextStyles.s12w400h696969,
                    ),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle(String status) {
    if (status == StatusWindowEnum.CLIENT_NOT_COME.name) {
      return AppTextStyles.s16w600hF64C4C;
    }
    if (status == StatusWindowEnum.CLIENT_CANCELLED.name) {
      return AppTextStyles.s16w600hF64C4C;
    }
    if (status == StatusWindowEnum.DONE.name) {
      return AppTextStyles.s16w600h385EO;
    }
    return AppTextStyles.s16w600h262626;
  }
}
