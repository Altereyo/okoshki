import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/bottomsheets/contact_us/contact_us_controller.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/app/widgets/sub_title_sheet.dart';

class ContactUsBottomSheet extends StatelessWidget {
  ContactUsBottomSheet({super.key, required this.isSaloon});
  final bool isSaloon;
  final String title = 'Связаться с нами';
  final controller = sl<ContactUsController>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => controller.isLoading
          ? SizedBox(
              height: 200,
              child: CircularLoadingWidget(isSaloon: isSaloon),
            )
          : isSaloon
              ? LayoutBottomSheet.saloon(
                  title: title,
                  children: [ViewBottomSheet()],
                )
              : LayoutBottomSheet.customer(
                  title: title,
                  children: [ViewBottomSheet()],
                ),
    );
  }
}

class ViewBottomSheet extends StatelessWidget {
  ViewBottomSheet({super.key});
  final String subTitle =
      'Дайте знать, если у вас возникли проблемы с оказанием услуг или работой приложения';
  final controller = sl<ContactUsController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubTitleSheet(subTitle: subTitle),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 56,
                child: OutlinedButton.icon(
                  style: AppButtonStyle.mainButtonStyle,
                  onPressed: controller.openInBrowser,
                  label: const Text('Telegram'),
                  icon: SvgPicture.asset(AppAssets.iconTelegram),
                ),
              ),
              SizedBox(
                height: 56,
                child: OutlinedButton.icon(
                  style: AppButtonStyle.mainButtonStyle,
                  onPressed: controller.makePhoneCall,
                  label: const Text('Позвонить'),
                  icon: SvgPicture.asset(AppAssets.iconCall),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Версия приложения: 1.0.0',
            style: AppTextStyles.s14w600h696969,
          ),
        )
      ],
    );
  }
}
