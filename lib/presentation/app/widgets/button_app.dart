import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';

class ButtonApp extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final double width;

  const ButtonApp.large({
    super.key,
    required this.title,
    required this.onPressed,
  }) : width = double.infinity;

  const ButtonApp.small({
    super.key,
    required this.title,
    required this.onPressed,
  }) : width = 156;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: width,
        height: 56,
        child: OutlinedButton(
          style: AppButtonStyle.mainButtonStyle,
          onPressed: onPressed,
          child: Text(title),
        ),
      ),
    );
  }
}

