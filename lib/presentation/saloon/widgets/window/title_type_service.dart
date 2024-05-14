import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class TitleTypeService extends StatelessWidget {
  const TitleTypeService(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final void Function() onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Вид услуги', style: AppTextStyles.s14w600h696969),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.s16w600h262626,
            ),
            IconButton(
              onPressed: onPressed,
              icon: SvgPicture.asset(
                AppAssets.iconEdit,
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
