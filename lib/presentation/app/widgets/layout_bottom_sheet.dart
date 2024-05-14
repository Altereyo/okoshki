import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class LayoutBottomSheet extends StatelessWidget {
  final String title;
  final Color color;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  LayoutBottomSheet.customer({
    super.key,
    this.padding,
    required this.title,
    required this.children,
  }) : color = AppColors.hex43BCCE;

  LayoutBottomSheet.saloon({
    super.key,
    this.padding,
    required this.title,
    required this.children,
  }) : color = AppColors.hex385EO;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.only(top: 22),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                title.isNotEmpty
                    ? Center(
                        child: Text(
                          title,
                          style: AppTextStyles.s26w600h262626,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(),
                ...children,
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(26),
              topRight: Radius.circular(26),
            ),
            color: AppColors.hexFFFFFF,
          ),
          height: 38,
          child: Center(
            child: Container(
              height: 6,
              width: 22,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
