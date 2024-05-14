import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:okoshki/domain/entities/city.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/customer/bottomsheets/selection_city_customer/selection_city_customer_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';

class SelectionCityCustomerBottomsheet extends StatelessWidget {
  const SelectionCityCustomerBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBottomSheet.customer(
      title: 'Выбери город',
      children: const [
        ListCity(),
      ],
    );
  }
}

class ListCity extends StatefulWidget {
  const ListCity({super.key});

  @override
  State<ListCity> createState() => _ListCityState();
}

class _ListCityState extends State<ListCity> {
  late GroupButtonController _radioController;
  final controller = sl<SelectionCityCustomerController>();

  @override
  void initState() {
    _radioController = GroupButtonController(
      //Текущий город
      selectedIndex: controller.citiesList.indexOf(controller.citiesList
          .firstWhere(
              (element) => element.id == controller.userProfile.targetCity)),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return Column(
      children: [
        GroupButton<City>(
          controller: _radioController,
          isRadio: true,
          options: const GroupButtonOptions(groupingType: GroupingType.column),
          buttons: controller.citiesList,
          buttonIndexedBuilder: (selected, index, context) {
            return RadioTile(
              title: controller.citiesList[index].title,
              selected: _radioController.selectedIndex,
              index: index,
              onTap: () {
                _radioController.selectIndex(index);
              },
            );
          },
          onSelected: (val, i, selected) =>
              debugPrint('Button: $val index: $i $selected'),
        ),
        ButtonCustomer.large(
          title: 'Сохранить',
          onPressed: () async {
            final idSelectedCity =
                controller.citiesList[_radioController.selectedIndex!].id;
            await controller.updateUserTargetCity(idSelectedCity);
            if (context.mounted) {
              appRouter.pop();
            }
          },
        )
      ],
    );
  }
}

class RadioTile extends StatelessWidget {
  const RadioTile({
    Key? key,
    required this.selected,
    required this.onTap,
    required this.index,
    required this.title,
  }) : super(key: key);

  final String title;
  final int index;
  final int? selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: AppTextStyles.s16w600h262626,
      ),
      onTap: onTap,
      trailing: Radio.adaptive(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        groupValue: selected,
        activeColor: AppColors.hexDF49B5,
        value: index,
        onChanged: (val) {
          onTap();
        },
      ),
    );
  }
}
