import 'package:flutter/cupertino.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:provider/provider.dart';

class SelectionDateButtomSheet extends StatelessWidget {
  const SelectionDateButtomSheet({super.key, this.recordDate});
  final ({DateTime? initialDate, DateTime? minimumDate})? recordDate;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => recordDate,
      child: LayoutBottomSheet.saloon(
        title: 'Выберите дату',
        children: const [
          ViewSheet(),
        ],
      ),
    );
  }
}

class ViewSheet extends StatefulWidget {
  const ViewSheet({super.key});

  @override
  State<ViewSheet> createState() => _ViewSheetState();
}

class _ViewSheetState extends State<ViewSheet> {
  DateTime selectDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final recordDate =
        Provider.of<({DateTime? initialDate, DateTime? minimumDate})?>(context);
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: CupertinoDatePicker(
            initialDateTime: recordDate?.initialDate ?? DateTime.now(),
            minimumDate: recordDate?.minimumDate,
            // minimumYear: 2023,
            maximumYear: 2050,
            mode: CupertinoDatePickerMode.monthYear,
            onDateTimeChanged: (val) {
              selectDateTime = val;
            },
          ),
        ),
        ButtonSaloon.large(
          title: 'Применить',
          onPressed: () async => appRouter.pop(selectDateTime),
        ),
      ],
    );
  }
}
