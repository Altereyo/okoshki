import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class SubTitleSheet extends StatelessWidget {
  const SubTitleSheet({super.key, required this.subTitle});
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Text(
        subTitle,
        textAlign: TextAlign.center,
        style: AppTextStyles.s16w400h262626,
      ),
    );
  }
}
