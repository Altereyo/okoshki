import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/customer/widgets/saloon_card.dart';

class InfoSaloonBottomSheet extends StatelessWidget {
  const InfoSaloonBottomSheet({super.key, required this.saloon});
  final Saloon saloon;
  @override
  Widget build(BuildContext context) {
    return LayoutBottomSheet.customer(
      title: '',
      children: [
        SaloonAndWindowCardWidget(saloon: saloon),
      ],
    );
  }
}
