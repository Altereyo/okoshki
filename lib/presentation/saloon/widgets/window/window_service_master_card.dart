import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/domain/entities/booking_window.dart';
import 'package:okoshki/domain/entities/extensions/booking_window.dart';
import 'package:okoshki/domain/entities/extensions/window_service.dart';
import 'package:okoshki/domain/entities/window_service.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';

class WindowServiceMasterCard extends StatelessWidget {
  const WindowServiceMasterCard(
      {super.key, required this.windowService, this.bookingWindow});
  final WindowService windowService;
  //если окно не активное
  final BookingWindow? bookingWindow;
  @override
  Widget build(BuildContext context) {
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
                    Expanded(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                windowService.master.name,
                                style: AppTextStyles.s16w600h262626,
                              ),
                              Text(
                                windowService.master.specialization ?? '',
                                style: AppTextStyles.s12w400h696969,
                              ),
                            ],
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        windowService.priceCurrency,
                        style: AppTextStyles.s16w600h262626,
                      ),
                      bookingWindow?.commissionAmount == null
                          ? Container()
                          : Text(
                              bookingWindow!.titleCommision,
                              style: AppTextStyles.s12w400h696969,
                            ),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }
}
