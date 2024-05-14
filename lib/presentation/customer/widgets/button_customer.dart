import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';

class ButtonCustomer extends StatefulWidget {
  final String title;
  final Future<void> Function()? onPressed;
  final double width;

  const ButtonCustomer.large({
    super.key,
    required this.title,
    required this.onPressed,
  }) : width = double.infinity;

  const ButtonCustomer.small({
    super.key,
    required this.title,
    required this.onPressed,
  }) : width = 156;

  @override
  State<ButtonCustomer> createState() => _ButtonCustomerState();
}

class _ButtonCustomerState extends State<ButtonCustomer> {
  bool isLoading = false;

  Future<void> onPressedButton() async {
    setState(() => isLoading = true);
    await widget.onPressed!();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: widget.width,
        height: 56,
        child: FilledButton(
          style: AppButtonStyle.mainCustomerButtonStyle,
          onPressed: !isLoading
              ? widget.onPressed != null
                  ? onPressedButton
                  : null
              : null,
          child: isLoading
              ? const CircularLoadingWidget(isSaloon: false)
              : Text(widget.title),
        ),
      ),
    );
  }
}
