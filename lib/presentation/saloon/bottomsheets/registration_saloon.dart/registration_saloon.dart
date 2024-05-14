import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:group_button/group_button.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/registration_saloon.dart/registration_saloon_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:provider/provider.dart';

class RegistrationSaloonBottomSheet extends StatelessWidget {
  const RegistrationSaloonBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<RegistrationSaloonController>();
    return Provider(
      create: (_) => controller,
      child: LayoutBottomSheet.saloon(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          MediaQuery.of(context).viewInsets.bottom,
        ),
        title: 'Заявка на регистрацию',
        children: const [
          FormSaloon(),
          ButtonSendAnApplication(),
        ],
      ),
    );
  }
}

class FormSaloon extends StatefulWidget {
  const FormSaloon({super.key});

  @override
  State<FormSaloon> createState() => _FormSaloonState();
}

class _FormSaloonState extends State<FormSaloon> {
  final _maskFormater = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RegistrationSaloonController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(hintText: 'Название салона'),
          onChanged: controller.setSaloonTitle,
        ),
        const SizedBox(height: 10),
        Observer(
          builder: (_) => controller.isLoading
              ? const CircularLoadingWidget(isSaloon: true)
              : GroupButton(
                  options: AppGroupButtonOptions.saloon,
                  isRadio: false,
                  buttons:
                      controller.servicesTypeList.map((e) => e.title).toList(),
                  onSelected: (String text, int index, bool onSelected) {
                    final id = controller.servicesTypeList[index].id;
                    if (onSelected) {
                      controller.addServices(id);
                    } else {
                      controller.removeServices(id);
                    }
                  },
                ),
        ),
        TextField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: 'Телефон для связи'),
            inputFormatters: [_maskFormater],
            onChanged: (val) {
              final phone = '8${_maskFormater.getUnmaskedText()}';
              controller.setPhoneNumber(phone);
            }),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: 'Контактный email'),
          onChanged: controller.setEmail,
        ),
      ],
    );
  }
}

class ButtonSendAnApplication extends StatelessWidget {
  const ButtonSendAnApplication({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<RegistrationSaloonController>(context);
    return Observer(
      builder: (_) => ButtonSaloon.large(
        title: 'Отправить заявку',
        onPressed: controller.isEnabledButtonRegistration
            ? () async {
                await controller.registrationSaloon();
                if (context.mounted) {
                  appRouter.pop();
                }
              }
            : null,
      ),
    );
  }
}
