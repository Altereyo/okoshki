import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class NotResultsWidget extends StatelessWidget {
  const NotResultsWidget(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: SvgPicture.asset(AppAssets.filtersNotResults),
          ),
          Text(
            title,
            style: AppTextStyles.s26w600h262626,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.s16w400h262626,
            ),
          ),
        ],
      ),
    );
  }
}
