import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFiledHourMinute extends StatefulWidget {
  const TextFiledHourMinute({
    super.key,
    required this.text,
    required this.hintText,
    required this.onChanged,
    required this.isReadOnly,
  });

  final String? text;
  final String? hintText;
  final Function(String p1)? onChanged;
  final bool isReadOnly;

  @override
  State<TextFiledHourMinute> createState() => _TextFiledHourMinuteState();
}

class _TextFiledHourMinuteState extends State<TextFiledHourMinute> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = widget.text ?? '';
    textEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: widget.text?.length ?? 0),
    );
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: TextField(
        readOnly: widget.isReadOnly,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: widget.hintText,
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(2),
        ],
        onChanged: widget.onChanged,
      ),
    );
  }
}
