import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class TextFieldBloc extends StatelessWidget {
  const TextFieldBloc({
    super.key,
    required this.titleBloc,
    required this.text,
    required this.hintText,
    required this.onChanged,
  });
  final String titleBloc;
  final String? text;
  final String? hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleBloc, style: AppTextStyles.s14w400h696969),
        TextField(
          controller: TextEditingController(text: text),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
