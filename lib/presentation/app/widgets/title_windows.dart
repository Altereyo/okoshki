import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class TitleWindows extends StatelessWidget {
  const TitleWindows({super.key, required this.day, required this.date});
  final String day;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: AppTextStyles.s14w600h696969,
          ),
          Text(
            date,
            style: AppTextStyles.s14w400h696969,
          ),
        ],
      ),
    );
  }
}