import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/presentation/app/bottomsheets/contact_us/contact_us.dart';
import 'package:okoshki/presentation/app/widgets/expansion_tile_help_tip.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/customer/screens/help_tip/help_tip_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';

@RoutePage()
class HelpTipCustomerScreen extends StatelessWidget {
  const HelpTipCustomerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = sl<HelpTipCustomerController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Помощь и советы'),
      ),
      body: Observer(
        builder: (_) => controller.isLoading
            ? const CircularLoadingWidget(
                isSaloon: false,
              )
            : const ViewScreen(),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<HelpTipCustomerController>();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: controller.helpTipCustomerList.length,
          itemBuilder: (context, index) {
            final helpTip = controller.helpTipCustomerList[index];
            return ExpansionTileHelpTiP(
              question: helpTip.question,
              answer: helpTip.answer,
              color: AppColors.hex43BCCE,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ButtonCustomer.large(
            title: 'Связаться с нами',
            onPressed: () async => showModalBottomSheet(
              isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (context) => ContactUsBottomSheet(
                isSaloon: false,
              ),
            ),
          ),
        )
      ],
    );
  }
}
