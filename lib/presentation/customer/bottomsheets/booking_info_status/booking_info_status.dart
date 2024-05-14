import 'package:flutter/material.dart';
import 'package:okoshki/internal/constants/status_booking.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/customer/bottomsheets/booking_info_status/booking_info_status_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/create_comment/create_comment.dart';
import 'package:okoshki/presentation/customer/bottomsheets/create_comment/create_comment_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/edit_comment/edit_comment.dart';
import 'package:okoshki/presentation/customer/bottomsheets/edit_comment/edit_comment_controller.dart';
import 'package:okoshki/presentation/customer/screens/booking_info/booking_info_controller.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';
import 'package:provider/provider.dart';

class BookingInfoStatusBottomSheet extends StatelessWidget {
  const BookingInfoStatusBottomSheet({super.key, required this.controller});
  final BookingInfoStatusController controller;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => controller,
      child: LayoutBottomSheet.customer(
        title: '',
        children: const [
          ViewBodySheet(),
        ],
      ),
    );
  }
}

class ViewBodySheet extends StatefulWidget {
  const ViewBodySheet({super.key});

  @override
  State<ViewBodySheet> createState() => _ViewBodySheetState();
}

class _ViewBodySheetState extends State<ViewBodySheet> {
  @override
  Widget build(BuildContext context) {
    final status = Provider.of<BookingInfoStatusController>(context).status;

    if (status == StatusBookingEnum.ACTIVE.name) {
      return const BookingStatusActive();
    }
    if (status == StatusBookingEnum.CANCELLED.name) {
      return const BookingStatusCanceledAndNotCome();
    }
    if (status == StatusBookingEnum.CLIENT_CANCELLED.name) {
      return const BookingStatusCanceledAndNotCome();
    }
    if (status == StatusBookingEnum.CLIENT_NOT_COME.name) {
      return const BookingStatusCanceledAndNotCome();
    }
    if (status == StatusBookingEnum.SERVICE_RENDERED.name) {
      return const BookingStatusServiceRendered();
    }
    return Container();
  }
}

class BookingStatusActive extends StatelessWidget {
  const BookingStatusActive({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<BookingInfoStatusController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonApp.small(
          title: 'О салоне',
          onPressed: () {
            final saloonDetailsCustomerController =
                sl<SaloonDetailsCustomerController>(
              param1: controller.saloonId,
            );
            appRouter.push(
              SaloonDetailsCustomerRoute(
                controller: saloonDetailsCustomerController,
              ),
            );
          },
        ),
        ButtonCustomer.small(
          title: 'QR-код',
          onPressed: () async {
            appRouter.pop();
            final controllerBooking = sl<BookingInfoCustomerController>(
              param1: controller.booking,
            );
            appRouter.push(
              BookingInfoCustomerRoute(
                controller: controllerBooking,
              ),
            );
          },
        ),
      ],
    );
  }
}

class BookingStatusCanceledAndNotCome extends StatelessWidget {
  const BookingStatusCanceledAndNotCome({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<BookingInfoStatusController>(context);
    return ButtonApp.large(
      title: 'О салоне',
      onPressed: () {
        final saloonDetailsCustomerController =
            sl<SaloonDetailsCustomerController>(
          param1: controller.saloonId,
        );
        appRouter.push(
          SaloonDetailsCustomerRoute(
            controller: saloonDetailsCustomerController,
          ),
        );
      },
    );
  }
}

class BookingStatusServiceRendered extends StatelessWidget {
  const BookingStatusServiceRendered({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<BookingInfoStatusController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonApp.small(
          title: 'О салоне',
          onPressed: () {
            final saloonDetailsCustomerController =
                sl<SaloonDetailsCustomerController>(
              param1: controller.saloonId,
            );
            appRouter.push(
              SaloonDetailsCustomerRoute(
                controller: saloonDetailsCustomerController,
              ),
            );
          },
        ),
        ButtonCustomer.small(
          title: 'Отзыв+',
          onPressed: () async {
            final comment = controller.getCommentFromTheSaloon;
            if (comment != null) {
              final controllerEditComment =
                  sl<EditCommentController>(param1: comment);
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) =>
                    EditCommentBottomSheet(controller: controllerEditComment),
              );
            } else {
              final controllerCreateComment = sl<CreateCommentController>(
                param1: controller.saloonId,
              );
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => CreateCommentBottomSheet(
                  controller: controllerCreateComment,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
