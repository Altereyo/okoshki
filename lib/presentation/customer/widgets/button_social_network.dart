import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonSocialNetwork extends StatelessWidget {
  const ButtonSocialNetwork({
    super.key,
    required this.assetIcon,
    required this.onPressed,
  });
  final String assetIcon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(assetIcon),
    );
  }
}
