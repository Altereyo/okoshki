import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_colors.dart';

class CircularLoadingWidget extends StatelessWidget {
  const CircularLoadingWidget({super.key, required this.isSaloon});
  final bool isSaloon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(
          isSaloon ? AppColors.hex385EO : AppColors.hex43BCCE,
        ),
        backgroundColor: isSaloon ? AppColors.hex385EOTransparent03 : AppColors.hex43BCCETransparent03,
      ),
    );
  }
}
