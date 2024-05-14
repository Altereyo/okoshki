import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class TitleBlocPageProfileInfo extends StatelessWidget {
  const TitleBlocPageProfileInfo(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 4),
          child: Text(
            title,
            style: AppTextStyles.s14w600h696969,
          ),
        ),
        subTitle != null ?
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Text(
            subTitle!,
            style: AppTextStyles.s14w400h696969,
          ),
        ): Container(height: 4),
      ],
    );
  }
}