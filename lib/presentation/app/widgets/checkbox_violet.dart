import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';

class CheckboxViolete extends StatefulWidget {
  const CheckboxViolete(
      {super.key, required this.isValue, required this.onChanged});
  final bool isValue;
  final Function(bool) onChanged;

  @override
  State<CheckboxViolete> createState() => _CheckboxVioleteState();
}

class _CheckboxVioleteState extends State<CheckboxViolete> {
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
      borderRadius: BorderRadius.circular(10),
      onTap: _onPressed,
      child: _isValue
          ? SvgPicture.asset(AppAssets.iconCheckboxActive)
          : SvgPicture.asset(AppAssets.iconCheckboxNotActive),
    );
  }
}
