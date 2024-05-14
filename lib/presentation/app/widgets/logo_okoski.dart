import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoOkoshki extends StatelessWidget {
  const LogoOkoshki({super.key, required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: 255,
      height: 48,
    );
  }
}
