import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:okoshki/domain/entities/city.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/radio_tile.dart';

//Возращает выбранный город
class SelectionCitySaloonBottomsheet extends StatefulWidget {
  const SelectionCitySaloonBottomsheet(
      {super.key, required this.citiesList, required this.currentCity});
  final List<City> citiesList;
  final City? currentCity;
  @override
  State<SelectionCitySaloonBottomsheet> createState() =>
      _SelectionCitySaloonBottomsheetState();
}

class _SelectionCitySaloonBottomsheetState
    extends State<SelectionCitySaloonBottomsheet> {
  late GroupButtonController _radioController;

  @override
  void initState() {
    _radioController = GroupButtonController(
      //Текущий город
      selectedIndex: widget.currentCity != null
          ? widget.citiesList.indexOf(
              widget.citiesList.firstWhere(
                  (element) => element.id == widget.currentCity!.id),
            )
          : 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return LayoutBottomSheet.saloon(
      title: 'Выберите город',
      children: [
        GroupButton<City>(
          controller: _radioController,
          isRadio: true,
          options: const GroupButtonOptions(
            groupingType: GroupingType.column,
          ),
          buttons: widget.citiesList,
          buttonIndexedBuilder: (selected, index, context) {
            return RadioTile(
              title: widget.citiesList[index].title,
              selected: _radioController.selectedIndex,
              index: index,
              onTap: () {
                _radioController.selectIndex(index);
              },
            );
          },
        ),
        ButtonSaloon.large(
          title: 'Сохранить',
          onPressed: () async {
            final selectedCity =
                widget.citiesList[_radioController.selectedIndex!];
            appRouter.pop(selectedCity);
          },
        )
      ],
    );
  }
}
