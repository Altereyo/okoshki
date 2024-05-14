import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';

class ViewIntroSlide extends StatelessWidget {
  const ViewIntroSlide(
      {super.key,
      required this.pathImage,
      required this.title,
      required this.subTitle});
  final String pathImage;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ImageNetworkIndicator(
            src: pathImage,
            height: 300,
            width: 300,
          ),
          const SizedBox(height: 32),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.s26w600h262626,
          ),
          const SizedBox(height: 32),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.s16w400h262626,
          ),
        ],
      ),
    );
  }
}
