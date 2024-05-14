import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/domain/entities/window_service.dart';
import 'package:okoshki/internal/constants/status_booking.dart';
import 'package:okoshki/internal/constants/status_window.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/window_status.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/delete/delete.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_window/edit_window.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_window/edit_window_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/window_detail/window_detail_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/window/text_date_window.dart';
import 'package:okoshki/presentation/saloon/widgets/window/window_service_master_card.dart';
import 'package:okoshki/presentation/saloon/widgets/window/window_service_client.dart';
import 'package:provider/provider.dart';

class WindowDetailBottomSheet extends StatelessWidget {
  const WindowDetailBottomSheet({super.key, required this.controller});
  final WindowDetailController controller;

  String get title {
    if (StatusWindowEnum.WAITING.name == controller.window.status) {
      return 'Что сделать с окошком?';
    }
    if (StatusWindowEnum.WAS_NOT_BOOKING.name == controller.window.status) {
      return 'Окошко';
    }
    return 'Бронь на окошко';
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => controller,
      child: LayoutBottomSheet.saloon(
        title: title,
        children: [
          TextDate(text: controller.window.dateTimeWindow),
          WindowStatusWidget(status: controller.window.status!),
          const InfoServiceBody(),
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
    final controller = Provider.of<WindowDetailController>(context);
    final windowStatus = controller.window.status;
    if (StatusWindowEnum.WAITING.name == windowStatus ||
        StatusWindowEnum.WAS_NOT_BOOKING.name == windowStatus) {
      return const WindowServiceNotClient();
    }
    if (StatusWindowEnum.DONE.name == windowStatus) {
      final bookingWindow = controller.window.bookingsWindow!.firstWhere(
        (element) => element.status == StatusBookingEnum.SERVICE_RENDERED.name,
      );
      final windowService = controller.window.services.firstWhere(
        (element) => element.id == bookingWindow.windowServiceId,
      );
      return WindowServiceClient(
        bookingWindow: bookingWindow,
        windowService: windowService,
      );
    }
    if (StatusWindowEnum.BOOKING.name == controller.window.status) {
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
    if (StatusWindowEnum.CLIENT_NOT_COME.name == controller.window.status) {
      final bookingWindow = controller.window.bookingsWindow!.firstWhere(
        (element) => element.status == StatusBookingEnum.CLIENT_NOT_COME.name,
      );
      final windowService = controller.window.services.firstWhere(
        (element) => element.id == bookingWindow.windowServiceId,
      );
      return WindowServiceClient(
        bookingWindow: bookingWindow,
        windowService: windowService,
      );
    }
    if (StatusWindowEnum.CLIENT_CANCELLED.name == controller.window.status) {
      final bookingWindow = controller.window.bookingsWindow!.firstWhere(
        (element) => element.status == StatusBookingEnum.CLIENT_CANCELLED.name,
      );
      final windowService = controller.window.services.firstWhere(
        (element) => element.id == bookingWindow.windowServiceId,
      );
      return WindowServiceClient(
        bookingWindow: bookingWindow,
        windowService: windowService,
      );
    }

    return Container();
  }
}

class WindowServiceNotClient extends StatelessWidget {
  const WindowServiceNotClient({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<WindowDetailController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...controller.window.windowServiceGroup.entries.map(
          (map) => WindowServiceGroup(map: map),
        ),
      ],
    );
  }
}

class WindowServiceGroup extends StatelessWidget {
  const WindowServiceGroup({super.key, required this.map});
  final MapEntry<int, List<WindowService>> map;
  @override
  Widget build(BuildContext context) {
    final service = map.value.first.service;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Услуга',
          style: AppTextStyles.s14w400h696969,
        ),
        Text(
          service.serviceType.title,
          style: AppTextStyles.s16w600h262626,
        ),
        Text(
          service.title,
          style: AppTextStyles.s12w400h696969,
        ),
        ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: map.value.length,
          itemBuilder: (_, index) {
            final windowService = map.value[index];
            return WindowServiceMasterCard(
              windowService: windowService,
            );
          },
        ),
        const Divider(),
      ],
    );
  }
}

class ButtomButton extends StatefulWidget {
  const ButtomButton({super.key});

  @override
  State<ButtomButton> createState() => _ButtomButtonState();
}

class _ButtomButtonState extends State<ButtomButton> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<WindowDetailController>(context);
    if (StatusWindowEnum.WAITING.name == controller.window.status) {
      return _statusWaiting();
    }
    if (StatusWindowEnum.DONE.name == controller.window.status) {
      return _statusDone();
    }
    if (StatusWindowEnum.BOOKING.name == controller.window.status) {
      return _statusBooking();
    }
    return Container();
  }

  Widget _statusWaiting() {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<WindowDetailController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _butDeleteWindow(),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: ButtonSaloon.large(
            title: 'Редактировать',
            onPressed: () async {
              final editWindowController = sl<EditWindowController>(
                param1: controller.window,
              );
              await showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => EditWindowBottomSheet(
                  controller: editWindowController,
                ),
              );
              if (context.mounted) {
                 appRouter.pop();
              }
            },
          ),
        )
      ],
    );
  }

  Widget _statusDone() {
    final controller = Provider.of<WindowDetailController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: OutlinedButton.icon(
          style: AppButtonStyle.mainButtonStyle,
          onPressed: controller.makePhoneCall,
          label: const Text('Позвонить клиенту'),
          icon: SvgPicture.asset(AppAssets.iconCall),
        ),
      ),
    );
  }

  Widget _statusBooking() {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<WindowDetailController>(context);
    return ButtonSaloon.large(
      title: 'Подтвердить',
      onPressed: () async {
        final isResult = await controller.updateBookingQr();
        if (isResult && context.mounted) {
          appRouter.pop();
        }
      },
    );
  }

  Widget _butDeleteWindow() {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<WindowDetailController>(context);
    return Expanded(
      child: ButtonApp.large(
        title: 'Удалить',
        onPressed: () async {
          final bool? isRes = await showModalBottomSheet(
            isScrollControlled: true,
            useSafeArea: true,
            context: context,
            builder: (context) => const DeleteBottomSheet(),
          );
          if (isRes == true) {
            await controller.deleteWindow();
            if (mounted) {
              appRouter.pop();
            }
          }
        },
      ),
    );
  }
}
