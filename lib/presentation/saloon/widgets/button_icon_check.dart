import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_colors.dart';

class ButtonIconCheck extends StatelessWidget {
  const ButtonIconCheck({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.check_outlined,
        color: AppColors.hex385EO,
        size: 32,
      ),
    );
  }
}
