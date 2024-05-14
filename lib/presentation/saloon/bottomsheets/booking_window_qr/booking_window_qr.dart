import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/internal/constants/status_booking.dart';
import 'package:okoshki/internal/constants/status_window.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/window_status.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/booking_window_qr/booking_window_qr_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/window/text_date_window.dart';
import 'package:okoshki/presentation/saloon/widgets/window/window_service_client.dart';
import 'package:provider/provider.dart';

class BookingWindowBottomSheet extends StatelessWidget {
  const BookingWindowBottomSheet({super.key, required this.controller});
  final BookingWindowQrController controller;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => controller,
      child: LayoutBottomSheet.saloon(
        title: 'Бронь на окошко',
        children: [
          TextDate(text: controller.window.dateTimeWindow),
          Observer(
            builder: (_) => controller.isBookingWindow
                ? WindowStatusWidget(status: StatusWindowEnum.DONE.name)
                : WindowStatusWidget(status: controller.window.status!),
          ),
          const InfoServiceBody(),
          const TextDoneBooking(),
          const ButtomButton(),
        ],
      ),
    );
  }
}

class InfoServiceBody extends StatelessWidget {
  const InfoServiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookingWindowQrController>(context);
    final bookingWindow = controller.window.bookingsWindow!.firstWhere(
      (element) => element.status == StatusBookingEnum.ACTIVE.name,
    );
    final windowService = controller.window.services.firstWhere(
      (element) => element.id == bookingWindow.windowServiceId,
    );
    controller.bookingActiveUId = bookingWindow.uid;
    return WindowServiceClient(
      bookingWindow: bookingWindow,
      windowService: windowService,
    );
  }
}

class TextDoneBooking extends StatelessWidget {
  const TextDoneBooking({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookingWindowQrController>(context);
    return Observer(
      builder: (_) => controller.isBookingWindow
          ? Center(
              child: Text(
                'Эта бронь подтверждена',
                style: AppTextStyles.s14w400h696969,
              ),
            )
          : Container(),
    );
  }
}

class ButtomButton extends StatelessWidget {
  const ButtomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return ButtonApp.large(
      title: 'Вернуться к списку окошек',
      onPressed: () {
        appRouter.popUntilRoot();
        appRouter.replaceNamed(PathRoute.homeSaloonScreen);
      },
    );
  }
}
