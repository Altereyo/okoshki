import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class ButtonTextIcon extends StatelessWidget {
  const ButtonTextIcon(
      {super.key, required this.title, required this.onPressed});
  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTextStyles.s16w600h385EO,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                child: Icon(
                  Icons.add,
                  color: AppColors.hex385EO,
                ),
              )
            ],
          ),
      ),
    );
  }
}
