import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_colors.dart';

class ContLoad extends StatelessWidget {
  const ContLoad({super.key, required this.height, required this.width});
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.hexEAEAEA,
      ),
    );
  }
}
