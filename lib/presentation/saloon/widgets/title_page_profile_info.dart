import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class TitlePageProfileInfo extends StatelessWidget {
  const TitlePageProfileInfo({super.key, required this.title, this.subTitle});
  final String title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.s16w400h262626,
            textAlign: TextAlign.center,
          ),
          subTitle != null ? 
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              subTitle ?? '',
              style: AppTextStyles.s14w400h696969,
              textAlign: TextAlign.center,
            ),
          ): Container(),
        ],
      ),
    );
  }
}