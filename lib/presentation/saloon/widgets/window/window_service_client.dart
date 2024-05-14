import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/booking_window.dart';
import 'package:okoshki/domain/entities/window_service.dart';
import 'package:okoshki/internal/constants/status_window.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/saloon/widgets/window/window_service_master_card.dart';

class WindowServiceClient extends StatelessWidget {
  const WindowServiceClient({
    super.key,
    required this.bookingWindow,
    required this.windowService,
  });
  //Бронь у окошка
  final BookingWindow bookingWindow;
  //Забронированная услуга у окошка
  final WindowService windowService;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Услуга',
          style: AppTextStyles.s14w400h696969,
        ),
        Text(
          windowService.service.serviceType.title,
          style: AppTextStyles.s16w600h262626,
        ),
        Text(
          windowService.service.title,
          style: AppTextStyles.s12w400h696969,
        ),
        const SizedBox(height: 8),
        WindowServiceMasterCard(
          windowService: windowService,
          bookingWindow: bookingWindow,
        ),
        const Divider(),
        _client(),
      ],
    );
  }

  Widget _client() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Клиент',
                  style: AppTextStyles.s14w400h696969,
                ),
              ),
              Expanded(
                child: Text(
                  'Телефон',
                  style: AppTextStyles.s14w400h696969,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  bookingWindow.client.username.isEmpty
                      ? 'Имя не указано'
                      : bookingWindow.client.username,
                  style: AppTextStyles.s16w600h262626,
                ),
              ),
              Expanded(
                child: Text(
                  bookingWindow.client.phoneNumber,
                  style: AppTextStyles.s16w600h262626,
                ),
              ),
            ],
          ),
          _clientBan(),
        ],
      ),
    );
  }

  Widget _clientBan() {
    if (bookingWindow.status == StatusWindowEnum.CLIENT_NOT_COME.name ||
        bookingWindow.status == StatusWindowEnum.CLIENT_CANCELLED.name) {
      return Row(
        children: [
          Text(
            'Клиент заблокирован',
            style: AppTextStyles.s12w400hF64C4C,
          ),
        ],
      );
    }
    return Container();
  }
}
