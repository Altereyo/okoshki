import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/saloon/widgets/button_icon_app.dart';
import 'package:okoshki/presentation/saloon/widgets/button_icon_check.dart';
import 'package:validators2/validators2.dart';

class TextFielBlocdEditSave extends StatefulWidget {
  const TextFielBlocdEditSave({
    super.key,
    required this.titleBloc,
    required this.text,
    required this.hintText,
    required this.onSave,
  });
  final String titleBloc;
  final String? text;
  final String? hintText;
  final ValueChanged<String> onSave;

  @override
  State<TextFielBlocdEditSave> createState() => _TextFielBlocdEditSaveState();
}

class _TextFielBlocdEditSaveState extends State<TextFielBlocdEditSave> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  bool isReadOnly = true;

  bool isEnabledSaveButton = false;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.text);
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void onChanged(String text) {
    if (isLength(text, 2)) {
      isEnabledSaveButton = true;
    } else {
      isEnabledSaveButton = false;
    }
    setState(() {});
  }

  void onPressedSave() {
    widget.onSave(_textEditingController.text.trim());
    isEnabledSaveButton = false;
    setReadOnly();
    
  }

  void onPressedEdit() {
    FocusScope.of(context).requestFocus(_focusNode); 
    setReadOnly();
  }

  void setReadOnly() {
    setState(() => isReadOnly = !isReadOnly);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.titleBloc, style: AppTextStyles.s14w400h696969),
          TextField(
            focusNode: _focusNode,
            readOnly: isReadOnly,
            controller: _textEditingController,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: isReadOnly
                  ? ButtonIconApp.edit(onPressed: onPressedEdit)
                  : isEnabledSaveButton
                      ? ButtonIconCheck(onPressed: onPressedSave)
                      : null,
            ),
          ),
        ],
      ),
    );
  }
}

