import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/domain/entities/extensions/social_network.dart';
import 'package:okoshki/domain/entities/social_network.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/checkbox_violet.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_social_network/edit_social_network_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';

class EditSocialNetworkBottomSheet extends StatelessWidget {
  const EditSocialNetworkBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<EditSocialNetworkController>();
    return LayoutBottomSheet.saloon(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      title: 'Соцсети',
      children: [
        Column(
          children: controller.editSocialNetworkList
              .map(
                (socialNetWork) => CardSocialNetwork(
                  socialNetwork: socialNetWork,
                ),
              )
              .toList(),
        ),
        ButtonSaloon.large(
          title: 'Сохранить',
          onPressed: () async {
            await controller.updateSocialNetwork();
            if (context.mounted) {
              appRouter.pop();
            }
          },
        ),
      ],
    );
  }
}

class CardSocialNetwork extends StatefulWidget {
  const CardSocialNetwork({super.key, required this.socialNetwork});
  final SocialNetwork socialNetwork;

  @override
  State<CardSocialNetwork> createState() => _CardSocialNetworkState();
}

class _CardSocialNetworkState extends State<CardSocialNetwork> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = widget.socialNetwork.sufix;
    textEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: widget.socialNetwork.sufix.length),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Row(
        children: [
          SvgPicture.asset(widget.socialNetwork.icon),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: textEditingController,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'name',
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    widget.socialNetwork.prefix,
                    style: AppTextStyles.s16w600h262626,
                  ),
                ),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 0, minHeight: 0),
              ),
              onChanged: (val) {
                final url =
                    'https://${widget.socialNetwork.prefix}${val.trim()}';
                widget.socialNetwork.url = url;
              },
            ),
          )),
          CheckboxViolete(
            isValue: widget.socialNetwork.isActive,
            onChanged: (val) => widget.socialNetwork.isActive = val,
          ),
        ],
      ),
    );
  }
}
