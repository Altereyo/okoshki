import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class ListTileCheckboxViolete extends StatefulWidget {
  const ListTileCheckboxViolete(
      {super.key,
      required this.title,
      required this.isValue,
      required this.onChanged});
  final String title;
  final bool isValue;
  final Function(bool) onChanged;

  @override
  State<ListTileCheckboxViolete> createState() =>
      _ListTileCheckboxVioleteState();
}

class _ListTileCheckboxVioleteState extends State<ListTileCheckboxViolete> {
  late bool _isValue;
  @override
  void initState() {
    _isValue = widget.isValue;
    super.initState();
  }

  void _onPressed() {
    setState(() {
      _isValue = !_isValue;
      widget.onChanged(_isValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      onTap: _onPressed,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: AppTextStyles.s16w600h262626,
                softWrap: true,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: _onPressed,
              child: _isValue
                  ? SvgPicture.asset(AppAssets.iconCheckboxActive)
                  : SvgPicture.asset(AppAssets.iconCheckboxNotActive),
            ),
          ],
        ),
      ),
    );
  }
}
