import 'package:flutter/material.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load_circle.dart';

class PreloadHistoryStatistickCard extends StatelessWidget {
  const PreloadHistoryStatistickCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContLoad(height: 10, width: 157),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContLoad(height: 10, width: 184),
            ContLoad(height: 28, width: 118),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContLoad(height: 10, width: 251),
                SizedBox(
                  height: 8,
                ),
                ContLoad(height: 10, width: 168),
              ],
            ),
            ContLoad(height: 16, width: 56),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            ContLoadCircle(height: 30, width: 30),
            SizedBox(width: 8),
            ContLoad(height: 10, width: 97),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
