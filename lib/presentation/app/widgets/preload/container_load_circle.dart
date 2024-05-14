
import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_colors.dart';

class ContLoadCircle extends StatelessWidget {
  const ContLoadCircle({super.key, required this.height, required this.width});
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.hexEAEAEA,
      ),
    );
  }
}