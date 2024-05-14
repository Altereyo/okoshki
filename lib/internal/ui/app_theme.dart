import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.hexFFFFFF,
  //font
  fontFamily: 'SFProDisplay',
  //slider
  sliderTheme: SliderThemeData(
    overlayShape: SliderComponentShape.noOverlay,
  ),
  //card
  cardTheme: CardTheme(
    surfaceTintColor: AppColors.hexFFFFFF,
    shadowColor: AppColors.hexFFFFFF,
  ),
  //appBar
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColors.hexFFFFFF,
    surfaceTintColor: AppColors.hexFFFFFF,
    shadowColor: AppColors.hex696969,
    titleTextStyle: AppTextStyles.s18w600h262626,
    iconTheme: IconThemeData(
      color: AppColors.hex696969,
    ),
  ),
  //bottom_sheet
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColors.hexFFFFFF,
    modalBackgroundColor: AppColors.hexFFFFFF,
    surfaceTintColor: AppColors.hexFFFFFF,
   // showDragHandle: true,
  ),
  //divider
  dividerTheme: DividerThemeData(
    color: AppColors.hexC0C0C0,
  ),
  //style -> textfield
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.hexC0C0C0,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.hexC0C0C0,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.hexC0C0C0,
      ),
    ),
    hintStyle: AppTextStyles.s16w400hC0C0C0,
  ),
  textSelectionTheme: TextSelectionThemeData(
    //style -> textfield
    cursorColor: AppColors.hex262626,
  ),
  textTheme: TextTheme(
    //style -> textfield
    bodyLarge: AppTextStyles.s16w600h262626,
  ),
);
