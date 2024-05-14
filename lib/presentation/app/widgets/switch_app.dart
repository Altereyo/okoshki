import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class SwitchApp extends StatefulWidget {
  final String title;
  final String subTitle;
  final Color color;
  final bool isValue;
  final ValueChanged<bool> onChanged;
  SwitchApp.customer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isValue,
    required this.onChanged,
  }) : color = AppColors.hex43BCCE;

  SwitchApp.saloon({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isValue,
    required this.onChanged,
  }) : color = AppColors.hex385EO;

  @override
  State<SwitchApp> createState() => _SwitchAppState();
}

class _SwitchAppState extends State<SwitchApp> {

  late bool isValue;

  @override
  void initState() {
    isValue = widget.isValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppTextStyles.s16w600h262626,
                ),
                Text(
                  widget.subTitle,
                  style: AppTextStyles.s14w400h696969,
                ),
              ],
            ),
          ),
         
          Switch.adaptive(
            activeTrackColor: widget.color,
            inactiveTrackColor: AppColors.hex979797,
            activeColor: AppColors.hexFFFFFF,
            inactiveThumbColor: AppColors.hexFFFFFF,
            trackOutlineWidth: const MaterialStatePropertyAll(0),
            value: isValue,
            onChanged: (val) {
              setState(() => isValue = val);
              widget.onChanged(val);
            },
          ),
        ],
      ),
    );
  }
}
