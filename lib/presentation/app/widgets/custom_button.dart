import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/internal/ui/app_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.loaderColor = Colors.white,
    this.isOutlined = false,
    this.isSmall = false,
    this.isSaloonColor = false,
    this.isLoading = false,
  });

  final String title;
  final void Function()? onPressed;
  final Color loaderColor;
  late final bool isOutlined;
  late final bool isSmall;
  late final bool isSaloonColor;
  late final bool isLoading;

  get content => isLoading
      ? SizedBox(
          height: 14,
          width: 14,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: loaderColor,
          ))
      : Text(title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      child: SizedBox(
        width: isSmall ? 156 : double.infinity,
        height: 56,
        child: isOutlined
            ? OutlinedButton(
                style: AppButtonStyle.mainButtonStyle,
                onPressed: isLoading ? null : onPressed,
                child: content,
              )
            : FilledButton(
                style: AppButtonStyle.mainSaloonButtonStyle.copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => isSaloonColor
                            ? AppColors.hex385EO
                            : AppColors.hex43BCCE)),
                onPressed: isLoading ? null : onPressed,
                child: content,
              ),
      ),
    );
  }
}
