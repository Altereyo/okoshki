import 'package:flutter/material.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load_circle.dart';

class PreloadWindowsSaloonCard extends StatelessWidget {
  const PreloadWindowsSaloonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContLoad(height: 14, width: 85),
            ContLoad(height: 14, width: 85),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContLoad(height: 14, width: 109),
            ContLoad(height: 28, width: 90),
          ],
        ),
        SizedBox(
          height: 68,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (_, __) {
              return const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: ContLoad(height: 36, width: 140));
            },
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContLoadCircle(height: 46, width: 46),
            ContLoad(height: 14, width: 120),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
