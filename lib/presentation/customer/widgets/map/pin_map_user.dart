import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_colors.dart';

class PinMapUser extends StatelessWidget {
  const PinMapUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
        ),
        child: Center(
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                color: AppColors.hex43BCCE,
                shape: BoxShape.circle
            ),
          ),
        ),
      ),
    );
  }
}
