import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class AppButtonStyle {
  static ButtonStyle mainCustomerButtonStyle = FilledButton.styleFrom(
    backgroundColor: AppColors.hex43BCCE,
    disabledBackgroundColor: AppColors.hex43BCCETransparent03,
    disabledForegroundColor: AppColors.hexFFFFFF,
    textStyle: AppTextStyles.s18w600h262626,
  );
  static ButtonStyle mainSaloonButtonStyle = FilledButton.styleFrom(
    backgroundColor: AppColors.hex385EO,
    disabledBackgroundColor: AppColors.hex385EOTransparent03,
    disabledForegroundColor: AppColors.hexFFFFFF,
    textStyle: AppTextStyles.s18w600h262626,
  );

  static ButtonStyle mainButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: AppColors.hex696969,
    textStyle: AppTextStyles.s18w600h262626,
    side: BorderSide(
      width: 2.0,
      color: AppColors.hex696969,
    ),
  );
}

class AppGroupButtonOptions {
  static GroupButtonOptions customer = GroupButtonOptions(
    runSpacing: 8,
    spacing: 8,
    textPadding: const EdgeInsets.symmetric(horizontal: 8),
    buttonHeight: 36,
    borderRadius: BorderRadius.circular(10),
    unselectedTextStyle: AppTextStyles.s14w600h696969,
    unselectedBorderColor: AppColors.hex696969,
    unselectedColor: AppColors.hexFFFFFF,
    unselectedShadow: [],
    selectedTextStyle: AppTextStyles.s14w600hFFFFFF,
    selectedBorderColor: AppColors.hex43BCCE,
    selectedColor: AppColors.hex43BCCE,
    selectedShadow: [],
    mainGroupAlignment: MainGroupAlignment.start,
  );

  static GroupButtonOptions saloon = GroupButtonOptions(
    runSpacing: 8,
    spacing: 8,
    textPadding: const EdgeInsets.symmetric(horizontal: 8),
    buttonHeight: 36,
    borderRadius: BorderRadius.circular(10),
    unselectedTextStyle: AppTextStyles.s14w600h696969,
    unselectedBorderColor: AppColors.hex696969,
    unselectedColor: AppColors.hexFFFFFF,
    unselectedShadow: [],
    selectedTextStyle: AppTextStyles.s14w600hFFFFFF,
    selectedBorderColor: AppColors.hex385EO,
    selectedColor: AppColors.hex385EO,
    selectedShadow: [],
    mainGroupAlignment: MainGroupAlignment.start,
  );
}
