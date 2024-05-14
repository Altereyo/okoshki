import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class TextDate extends StatelessWidget {
  const TextDate({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.s16w400h262626,
        ),
      ),
    );
  }
}
