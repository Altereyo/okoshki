import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_colors.dart';

class RefreshIndicatorApp extends StatelessWidget {
  RefreshIndicatorApp.saloon({
    super.key,
    required this.onRefresh,
    required this.child,
  }) : color = AppColors.hex385EO;
  RefreshIndicatorApp.customer({
    super.key,
    required this.onRefresh,
    required this.child,
  }) : color = AppColors.hex43BCCE;
  final Future<void> Function() onRefresh;
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.hexFFFFFF,
      backgroundColor: color,
      child: child,
    );
  }
}
