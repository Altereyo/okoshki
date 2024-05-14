import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/saloon/widgets/button_icon_app.dart';
import 'package:okoshki/presentation/saloon/widgets/button_icon_check.dart';

class TextFieldDescriptionSaloon extends StatefulWidget {
  const TextFieldDescriptionSaloon({
    super.key,
    required this.description,
    required this.onSave,
  });

  final String? description;
  final ValueChanged<String> onSave;

  @override
  State<TextFieldDescriptionSaloon> createState() =>
      _TextFieldDescriptionSaloonState();
}

class _TextFieldDescriptionSaloonState
    extends State<TextFieldDescriptionSaloon> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  bool isReadOnly = true;

  bool isEnabledSaveButton = false;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.description);
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void onPressedSave() {
    widget.onSave(_textEditingController.text.trim());
    isEnabledSaveButton = false;
    setReadOnly();
  }

  void onPressedEdit() {
    FocusScope.of(context).requestFocus(_focusNode);
    isEnabledSaveButton = true;
    setReadOnly();
  }

  void setReadOnly() {
    setState(() => isReadOnly = !isReadOnly);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Немного описания салона (необязательно)',
          style: AppTextStyles.s14w400h696969,
        ),
        SizedBox(
          height: 150,
          child: TextField(
            focusNode: _focusNode,
            readOnly: isReadOnly,
            controller: _textEditingController,
            maxLines: null,
            expands: true,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            maxLength: 500,
            decoration: InputDecoration(
              hintText: 'Введите текст описания здесь',
              suffixIcon: isReadOnly
                  ? ButtonIconApp.edit(onPressed: onPressedEdit)
                  : isEnabledSaveButton
                      ? ButtonIconCheck(onPressed: onPressedSave)
                      : null,
            ),
          ),
        ),
      ],
    );
  }
}
