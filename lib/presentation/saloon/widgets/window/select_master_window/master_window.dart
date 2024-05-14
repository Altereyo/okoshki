import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/checkbox_violet.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';
import 'package:okoshki/presentation/saloon/widgets/window/select_master_window/master_window_controller.dart';

class MasterWindowWidget extends StatelessWidget {
  const MasterWindowWidget({super.key, required this.store});

  final MasterWindowController store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: store.saloonMaster.avatar != null
                ? ImageNetworkIndicator(
                    src: store.saloonMaster.avatar!,
                    height: 46,
                    width: 46,
                  )
                : SvgPicture.asset(AppAssets.avatarMaster),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  store.saloonMaster.name,
                  style: AppTextStyles.s16w600h262626,
                ),
                Text(
                  store.saloonMaster.specialization ?? '',
                  style: AppTextStyles.s14w400h262626,
                ),
              ],
            ),
          ),
          Observer(
            builder: (_) => SizedBox(
              width: 80,
              child: TextFormField(
                initialValue: store.prise,
                readOnly: store.isSelect,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.currency_ruble,
                    size: 16,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                  hintText: '0',
                ),
                onChanged: (price) => store.prise = price,
              ),
            ),
          ),
          const SizedBox(width: 16),
          CheckboxViolete(
            isValue: store.isSelect,
            onChanged: (val) => store.isSelect = val,
          ),
        ],
      ),
    );
  }
}