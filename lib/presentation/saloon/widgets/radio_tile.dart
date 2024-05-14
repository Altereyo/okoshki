
import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class RadioTile extends StatelessWidget {
  const RadioTile({
    Key? key,
    required this.selected,
    required this.onTap,
    required this.index,
    required this.title,
  }) : super(key: key);

  final String title;
  final int index;
  final int? selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: AppTextStyles.s16w600h262626,
      ),
      onTap: onTap,
      trailing: Radio.adaptive(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        groupValue: selected,
        activeColor: AppColors.hexDF49B5,
        value: index,
        onChanged: (val) {
          onTap();
        },
      ),
    );
  }
}