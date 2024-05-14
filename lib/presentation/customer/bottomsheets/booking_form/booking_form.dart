import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_button/group_button.dart';
import 'package:okoshki/domain/entities/booking.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/domain/entities/extensions/window_service.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/entities/window_service.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/dialogs/client_not_auth.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/customer/bottomsheets/booking_form/booking_form_controller.dart';
import 'package:okoshki/presentation/customer/screens/booking_info/booking_info_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';
import 'package:okoshki/presentation/customer/widgets/timer_end_time.dart';
import 'package:provider/provider.dart';

class BookingFormBottomSheet extends StatelessWidget {
  const BookingFormBottomSheet({super.key, required this.controller});
  final BookingFormController controller;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => controller,
      child: Observer(
        builder: (_) => controller.isLoading
            ? const SizedBox(
                height: 200,
                child: CircularLoadingWidget(
                  isSaloon: true,
                ),
              )
            : LayoutBottomSheet.customer(
                title: 'Выберите услугу',
                children: const [
                    TimeText(),
                    GroupButtonTimeWindow(),
                    WindowEndTimer(),
                    GroupButtonServiceWindow(),
                    MasterWindow(),
                    BottomButton(),
                  ]),
      ),
    );
  }
}

class TimeText extends StatelessWidget {
  const TimeText({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookingFormController>(context);
    return Observer(
      builder: (_) => controller.selectWindow != null
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: RichText(
                text: TextSpan(
                  text: 'Выбранное ',
                  style: AppTextStyles.s14w600h696969,
                  children: [
                    TextSpan(
                      text: 'на ${controller.selectWindow!.dateDay}',
                      style: AppTextStyles.s14w600h262626,
                    ),
                    TextSpan(
                      text: ' время',
                      style: AppTextStyles.s14w600h696969,
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Окошко на выбранное время забронировано, выберите другое время',
                style: AppTextStyles.s14w600h262626,
              ),
            ),
    );
  }
}

class GroupButtonTimeWindow extends StatelessWidget {
  const GroupButtonTimeWindow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookingFormController>(context);
    return SizedBox(
      height: 46,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          GroupButton<Window>(
            options: AppGroupButtonOptions.customer,
            controller: controller.buttonTimeWindowController,
            isRadio: true,
            buttons: controller.windowsList,
            buttonTextBuilder: (_, window, __) {
              return window.timeWindow;
            },
            onSelected: (window, _, __) {
              controller.selectWindow = window;
            },
          ),
        ],
      ),
    );
  }
}

class GroupButtonServiceWindow extends StatelessWidget {
  const GroupButtonServiceWindow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookingFormController>(context);
    return Observer(
      builder: (_) => controller.selectWindow != null
          ? GroupButton<Service>(
              isRadio: true,
              options:
                  const GroupButtonOptions(groupingType: GroupingType.column),
              controller: controller.buttonServicesController,
              buttons: controller.servicesList,
              buttonIndexedBuilder: (select, index, _) {
                final service = controller.servicesList[index];

                return RadioTileWindowService(
                  selected: controller.buttonServicesController.selectedIndex,
                  onTap: () {
                    controller.buttonServicesController.selectIndex(index);
                    controller.selectService = controller.servicesList[index];
                  },
                  index: index,
                  subTitle: service.title,
                  title: service.serviceType.title,
                  trailing: controller.selectWindow!
                      .priceMinMaxServiceWindow(service),
                );
              },
            )
          : Container(),
    );
  }
}

class RadioTileWindowService extends StatelessWidget {
  const RadioTileWindowService({
    Key? key,
    required this.selected,
    required this.onTap,
    required this.index,
    required this.title,
    required this.subTitle,
    required this.trailing,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String trailing;
  final int index;
  final int? selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: AppTextStyles.s16w600h262626,
      ),
      subtitle: Text(
        subTitle,
        style: AppTextStyles.s14w400h696969,
      ),
      onTap: onTap,
      trailing: Text(
        trailing,
        style: AppTextStyles.s16w600h262626,
      ),
      leading: Transform.scale(
        scale: 1.5,
        child: Radio.adaptive(
          materialTapTargetSize: MaterialTapTargetSize.padded,
          groupValue: selected,
          activeColor: AppColors.hexDF49B5,
          value: index,
          onChanged: (val) {
            onTap();
          },
        ),
      ),
    );
  }
}

class MasterWindow extends StatelessWidget {
  const MasterWindow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookingFormController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Observer(builder: (_)=> controller.selectWindow != null ? Text(
          'Специалист',
          style: AppTextStyles.s14w600h696969,
        ): Container(),),
        Observer(
          builder: (_) => SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                GroupButton<WindowService>(
                  controller: controller.buttonMasterController,
                  isRadio: true,
                  buttons: controller.windowServicesList.toList(),
                  buttonIndexedBuilder: (select, index, __) {
                    final windowService = controller.windowServicesList[index];
                    return ButtonMasterServiceWindow(
                      windowService: windowService,
                      selected: select,
                      onTap: () {
                        controller.selectWindowService = windowService;
                        controller.buttonMasterController.selectIndex(index);
                      },
                    );
                  },
                  onSelected: (window, _, __) {
                    //controller.selectWindow = window;
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonMasterServiceWindow extends StatelessWidget {
  const ButtonMasterServiceWindow(
      {super.key,
      required this.windowService,
      required this.selected,
      required this.onTap});
  final WindowService windowService;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: selected ? AppColors.hex43BCCE : AppColors.hex696969,
          ),
          color: selected ? AppColors.hex43BCCE : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
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
              style: selected
                  ? AppTextStyles.s14w600hFFFFFF
                  : AppTextStyles.s14w600h696969,
            ),
          ],
        ),
      ),
    );
  }
}

class WindowEndTimer extends StatelessWidget {
  const WindowEndTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookingFormController>(context);
    return Observer(
      builder: (_) => controller.selectWindow != null
          ? TimerEndTime(
              endDateTime: controller.selectWindow!.endDateTime,
            )
          : Container(
            height: 16,
          ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<BookingFormController>(context);
    return Observer(
      builder: (_) => controller.selectWindowService == null
          ? const ButtonCustomer.large(
              title: 'Подтвердить бронь',
              onPressed: null,
            )
          : ButtonBooking(
              price: controller.selectWindowService!.priceCurrency,
              onPressed: () async {
                final Booking? booking = await controller.createBooking();

                if (booking != null && context.mounted) {
                  final controllerBooking =
                      sl<BookingInfoCustomerController>(param1: booking);

                  appRouter.pop();
                  appRouter.push(
                    BookingInfoCustomerRoute(
                      controller: controllerBooking,
                    ),
                  );
                } else {
                  if (context.mounted) {
                    showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return const ClientNotAuthDialog.booking();
                      },
                    );
                  }
                }
              },
            ),
    );
  }
}

class ButtonBooking extends StatefulWidget {
  const ButtonBooking({super.key, this.onPressed, required this.price});
  final String price;
  final Future<void> Function()? onPressed;

  @override
  State<ButtonBooking> createState() => _ButtonBookingState();
}

class _ButtonBookingState extends State<ButtonBooking> {
  bool isLoading = false;
  Future<void> onPressedButton() async {
    setState(() => isLoading = true);
    await widget.onPressed!();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: FilledButton(
          style: AppButtonStyle.mainCustomerButtonStyle,
          onPressed: !isLoading
              ? widget.onPressed != null
                  ? onPressedButton
                  : null
              : null,
          child: isLoading
              ? const CircularLoadingWidget(isSaloon: false)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Подтвердить бронь'),
                    Text(widget.price),
                  ],
                ),
        ),
      ),
    );
  }
}
