import 'package:flutter/material.dart';
import 'package:okoshki/internal/constants/status_window.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class WindowStatusWidget extends StatelessWidget {
  const WindowStatusWidget({
    super.key,
    required this.status,
  });
  final String status;

  Color color() {
    if (StatusWindowEnum.WAITING.name == status) {
      return AppColors.hexFFB444;
    }
    if (StatusWindowEnum.WAS_NOT_BOOKING.name == status) {
      return AppColors.hexEAEAEA;
    }
    if (StatusWindowEnum.BOOKING.name == status) {
      return AppColors.hexDF49B5;
    }
    if (StatusWindowEnum.CLIENT_NOT_COME.name == status) {
      return AppColors.hexF64C4C;
    }
    if (StatusWindowEnum.DONE.name == status) {
      return AppColors.hex385EO;
    }
    if (StatusWindowEnum.CLIENT_CANCELLED.name == status) {
      return  AppColors.hex979797;
    }
    return Colors.red;
  }

  String title() {
    if (StatusWindowEnum.WAITING.name == status) {
      return 'Ждёт бронь';
    }
    if (StatusWindowEnum.WAS_NOT_BOOKING.name == status) {
      return 'Не было броней';
    }
    if (StatusWindowEnum.BOOKING.name == status) {
      return 'Есть бронь';
    }
    if (StatusWindowEnum.CLIENT_NOT_COME.name == status) {
      return 'Клиент не пришёл';
    }
    if (StatusWindowEnum.DONE.name == status) {
      return 'Выполнено';
    }
    if (StatusWindowEnum.CLIENT_CANCELLED.name == status) {
      return 'Отменено клиентом';
    }
    return 'null';
  }
  TextStyle textStyle(){
    if (StatusWindowEnum.WAITING.name == status) {
      return AppTextStyles.s14w600hFFFFFF;
    }
    if (StatusWindowEnum.WAS_NOT_BOOKING.name == status) {
      return AppTextStyles.s14w600h696969;
    }
    if (StatusWindowEnum.BOOKING.name == status) {
      return AppTextStyles.s14w600hFFFFFF;
    }
    if (StatusWindowEnum.CLIENT_NOT_COME.name == status) {
      return AppTextStyles.s14w600hFFFFFF;
    }
    if (StatusWindowEnum.DONE.name == status) {
      return AppTextStyles.s14w600hFFFFFF;
    }
    if (StatusWindowEnum.CLIENT_CANCELLED.name == status) {
      return AppTextStyles.s14w600hFFFFFF;
    }
    return AppTextStyles.s14w600hFFFFFF;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 28,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                color: color()),
            child: Center(
              child: Text(
                title(),
                style: textStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
