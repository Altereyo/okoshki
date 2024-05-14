import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class ExpansionTileHelpTiP extends StatelessWidget {
  const ExpansionTileHelpTiP(
      {super.key,
      required this.question,
      required this.answer,
      required this.color});
  final String question;
  final String answer;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      collapsedIconColor: color,
      iconColor: color,
      collapsedShape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      title: Text(
        question,
        style: AppTextStyles.s16w600h262626,
      ),
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                answer,
                style: AppTextStyles.s14w400h262626,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
