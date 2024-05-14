import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class ButtonService extends StatelessWidget {
  const ButtonService({super.key, required this.title, required this.onTap});
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: AppColors.hex696969,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: AppTextStyles.s14w600h696969,
          ),
        ),
      ),
    );
  }
}
