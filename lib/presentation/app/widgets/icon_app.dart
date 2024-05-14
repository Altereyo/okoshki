import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonApp extends StatelessWidget {
  const IconButtonApp({
    super.key,
    required this.path,
    this.onPressed,
    required this.color,
    this.size,
  });
  final String path;
  final void Function()? onPressed;
  final Color color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        path,
        height: size ?? 30,
        width: size ?? 30,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
