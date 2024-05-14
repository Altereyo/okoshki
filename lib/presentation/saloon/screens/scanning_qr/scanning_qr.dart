import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/booking_window_qr/booking_window_qr.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/booking_window_qr/booking_window_qr_controller.dart';
import 'package:okoshki/presentation/saloon/screens/scanning_qr/scanning_qr_controller.dart';

@RoutePage()
class ScanningQrSaloonScreen extends StatelessWidget {
  const ScanningQrSaloonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ScannerQr(),
          //Container(color: Colors.black),
          BottomWidget(),
        ],
      ),
    );
  }
}

class ScannerQr extends StatefulWidget {
  const ScannerQr({super.key});

  @override
  State<ScannerQr> createState() => _ScannerQrState();
}

class _ScannerQrState extends State<ScannerQr> {
  final scannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      formats: [BarcodeFormat.qrCode]);

  final controller = sl<ScanningQrSaloonController>();

  @override
  void initState() {
    //Переросовка после от бага при первом запуске
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => scannerController
        ..stop()
        ..start(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.isError = null;
    scannerController.dispose();
    super.dispose();
  }

  void _onDetected(BarcodeCapture capture) async {
    for (final barcode in capture.barcodes) {
      final bookingUid = barcode.rawValue;

      if (bookingUid != null) {
        //Проверяет есть ли окошко у салона в списке
        final window = await controller.getWindowTheBooking(bookingUid);
        if (window != null) {
          controller.isError = false;
          await Future.delayed(const Duration(milliseconds: 500));
          // scannerController.stop();
          controller.isError = null;
          await _navigationToDetailWindow(window);
          //scannerController.start();
        } else {
          controller.isError = true;
        }
      }
    }
  }

  Future<void> _navigationToDetailWindow(Window window) async {
    final bookingWindowController = sl<BookingWindowQrController>(
      param1: window,
    );
    if (context.mounted) {
      await showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (context) => BookingWindowBottomSheet(
          controller: bookingWindowController,
        ),
      );
    }

    // final controllerWindow = sl<WindowDetailController>(param1: window);
    // if (context.mounted) {
    //   await showModalBottomSheet(
    //     isScrollControlled: true,
    //     useSafeArea: true,
    //     context: context,
    //     builder: (context) => WindowDetailBottomSheet(
    //       controller: controllerWindow,
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: MobileScanner(
        controller: scannerController,
        onDetect: _onDetected,
        //Ошибка сканера
        errorBuilder: (_, contr, __) {
          return Center(
            child: Text(contr.errorDetails!.message!),
          );
        },
        overlay: _border(),
      ),
    );
  }

  Widget _border() {
    final controller = sl<ScanningQrSaloonController>();
    final height = (MediaQuery.of(context).size.height - 200) / 2 - 110;
    return Observer(
      builder: (_) => Positioned(
        top: height,
        child: SvgPicture.asset(
          AppAssets.borderQr,
          width: 220,
          height: 220,
          colorFilter: ColorFilter.mode(
            controller.isError == null
                ? AppColors.hexFFFFFF
                : controller.isError!
                    ? AppColors.hexF64C4C
                    : AppColors.hex385EO,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<ScanningQrSaloonController>();
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.hexFFFFFF,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Observer(
              builder: (_) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Container(
                      height: 6,
                      width: 22,
                      decoration: BoxDecoration(
                        color: AppColors.hex385EO,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      controller.isError == true
                          ? 'Ошибка сканирования'
                          : 'Отсканируйте QR-код',
                      style: AppTextStyles.s26w600h262626,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Observer(
              builder: (_) => controller.isError == true
                  ? Text(
                      'Некорректный код. Попробуйте другой',
                      style: AppTextStyles.s16w400hF64C4C,
                    )
                  : Text(
                      'Поместите код в рамку зоны сканирования',
                      style: AppTextStyles.s16w400h262626,
                    ),
            ),
          ),
          ButtonApp.small(
            title: 'Отменить',
            onPressed: appRouter.pop,
          ),
        ],
      ),
    );
  }
}
