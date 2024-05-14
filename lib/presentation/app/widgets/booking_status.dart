import 'package:flutter/material.dart';
import 'package:okoshki/internal/constants/status_booking.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';


class BookingStatusWidget extends StatelessWidget {
  const BookingStatusWidget({
    super.key,
    required this.status,
  });
  final String status;

  Color color() {
    if(StatusBookingEnum.ACTIVE.name == status){
      return AppColors.hex43BCCE;
    }
    if(StatusBookingEnum.CANCELLED.name == status){
      return AppColors.hex979797;
    }
    if(StatusBookingEnum.CLIENT_CANCELLED.name == status){
      return AppColors.hex979797;
    }
    if(StatusBookingEnum.CLIENT_NOT_COME.name == status){
      return AppColors.hexF64C4C;
    }
    if(StatusBookingEnum.SERVICE_RENDERED.name == status){
      return AppColors.hex0BD0AD;
    }
    return Colors.red;
  }

  String title() {
     if(StatusBookingEnum.ACTIVE.name == status){
      return 'Активная бронь';
    }
    if(StatusBookingEnum.CANCELLED.name == status){
      return 'Oтменена';
    }
    if(StatusBookingEnum.CLIENT_CANCELLED.name == status){
      return 'Отменено клиентом';
    }
    if(StatusBookingEnum.CLIENT_NOT_COME.name == status){
      return 'Не посещено';
    }
    if(StatusBookingEnum.SERVICE_RENDERED.name == status){
      return 'Услуга оказана';
    }
    return 'null';
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
                style: AppTextStyles.s14w600hFFFFFF,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
