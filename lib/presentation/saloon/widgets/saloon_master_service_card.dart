import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/saloon_master_service.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/checkbox_violet.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/delete/delete.dart';
import 'package:okoshki/presentation/saloon/widgets/button_icon_app.dart';

class SaloonMasterServiceCard extends StatefulWidget {
  const SaloonMasterServiceCard(
      {super.key,
      required this.saloonMasterService,
      required this.onDeleteService});
  final SaloonMasterService saloonMasterService;
  final ValueChanged<SaloonMasterService> onDeleteService;

  @override
  State<SaloonMasterServiceCard> createState() =>
      _SaloonMasterServiceCardState();
}

class _SaloonMasterServiceCardState extends State<SaloonMasterServiceCard> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = widget.saloonMasterService.price;
    textEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: widget.saloonMasterService.price.length),
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              CheckboxViolete(
                isValue: widget.saloonMasterService.isActive,
                onChanged: (val) {
                  //меняет активную услугу
                  widget.saloonMasterService.isActive = val;
                },
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.saloonMasterService.service.title,
                      style: AppTextStyles.s16w600h262626,
                    ),
                    Text(
                      widget.saloonMasterService.service.serviceType.title,
                      style: AppTextStyles.s14w400h696969,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      Icons.currency_ruble,
                      size: 16,
                      
                    ),
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 0, minHeight: 0),
                    hintText: '0',
                  ),
                  onChanged: (price) {
                    //изменение цены
                    if (price.isEmpty) {
                      widget.saloonMasterService.price = '0';
                    } else {
                      widget.saloonMasterService.price = price;
                    }
                  },
                ),
              ),
              ButtonIconApp.delete(
                onPressed: () async {
                  final bool? isRes = await showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    context: context,
                    builder: (context) => const DeleteBottomSheet(),
                  );
                  if (isRes == true) {
                    //обратный вызов удаления услуги мастера
                    widget.onDeleteService(widget.saloonMasterService);
                  }
                },
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
