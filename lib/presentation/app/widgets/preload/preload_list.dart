import 'package:flutter/material.dart';


class PreloadListWidget extends StatelessWidget {
  const PreloadListWidget({super.key, required this.card});
  final Widget card;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: 10,
      itemBuilder: (context, index) =>  card,
    );
  }
}