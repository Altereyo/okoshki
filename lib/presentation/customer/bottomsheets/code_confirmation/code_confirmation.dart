import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/sub_title_sheet.dart';
import 'package:okoshki/presentation/customer/bottomsheets/code_confirmation/code_confirmation_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';
import 'package:provider/provider.dart';

class CodeConfirmationBottomSheet extends StatelessWidget {
  const CodeConfirmationBottomSheet({super.key, required this.controller});
  final CodeConfirmationController controller;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => controller,
      child: LayoutBottomSheet.customer(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          MediaQuery.of(context).viewInsets.bottom,
        ),
        title: 'Код подтверждения',
        children: [
          SubTitleSheet(
            subTitle:
                'Теперь введите код из смс, который направлен на номер: ${controller.phoneNumber} ',
          ),
          const FormCode(),
          const ErrorText(),
          const ButtonConfirmCode(),
        ],
      ),
    );
  }
}

class ErrorText extends StatelessWidget {
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CodeConfirmationController>(context);
    return Observer(
      builder: (_) => controller.errorAuthorize.isEmpty
          ? Container()
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                controller.errorAuthorize,
                textAlign: TextAlign.center,
                style: AppTextStyles.s14w400hF64C4C,
              ),
            ),
    );
  }
}

class FormCode extends StatefulWidget {
  const FormCode({super.key});

  @override
  State<FormCode> createState() => _FormCodeState();
}

class _FormCodeState extends State<FormCode> {
  var codeTextField = <String?>[null, null, null, null];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CodeConfirmationController>(context);

    void buttonValidate() {
      //Провера на наличие
      //Если код не полный то выход
      for (var val in codeTextField) {
        if (val == null) {
          controller.smsCode = '';
          controller.errorAuthorize = '';
          return;
        }
      }
      //Если код имеет 4цифры
      // Устанавливает смс код
      var codeSMS = '';
      for (var pin in codeTextField) {
        codeSMS += pin!;
      }
      controller.smsCode = codeSMS;
    }

    //Устанавливает пин
    void setCode(String val, int pin) {
      if (val.length == 1) {
        codeTextField[pin] = val;
        //переключение фокуса
        if (pin == 3) {
          FocusScope.of(context).unfocus();
        } else {
          FocusScope.of(context).nextFocus();
        }
      } else {
        // controller.errorSmsCode = null;
        codeTextField[pin] = null;
      }
      //переключение фокуса
      if (pin > 0 && val.isEmpty) {
        FocusScope.of(context).previousFocus();
      }
      buttonValidate();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFieldPin(onChanged: (val) => setCode(val, 0)),
        TextFieldPin(onChanged: (val) => setCode(val, 1)),
        TextFieldPin(onChanged: (val) => setCode(val, 2)),
        TextFieldPin(onChanged: (val) => setCode(val, 3)),
      ],
    );
  }
}

class TextFieldPin extends StatelessWidget {
  const TextFieldPin({super.key, required this.onChanged});
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CodeConfirmationController>(context);
    return Observer(
      builder: (_) => SizedBox(
        height: 60,
        width: 60,
        child: TextField(
          autofocus: true,
          onChanged: onChanged,
          style: controller.errorAuthorize.isEmpty
              ? AppTextStyles.s26w600h262626
              : AppTextStyles.s26w600hF64C4C,
          decoration: InputDecoration(
            hintText: '0',
            hintStyle: Theme.of(context).textTheme.bodyLarge!.merge(
                  AppTextStyles.s26w400hC0C0C0,
                ),
          ),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }
}

class ButtonConfirmCode extends StatelessWidget {
  const ButtonConfirmCode({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<CodeConfirmationController>(context);
    return Observer(
      builder: (_) => ButtonCustomer.large(
        title: 'Подтвердить',
        onPressed: controller.isEnabledButtonConfirm
            ? () async {
                await controller.authorize();

                if (controller.errorAuthorize.isEmpty) {
                  if (controller.isIntroShown) {
                    appRouter.replaceNamed(PathRoute.homeCustomerScreen);
                  } else {
                    appRouter.replaceNamed(PathRoute.introCustomerScreen);
                  }
                }
              }
            : null,
      ),
    );
  }
}
