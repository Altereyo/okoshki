import 'package:flutter/material.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';

class ImageNetworkIndicator extends StatelessWidget {
  const ImageNetworkIndicator(
      {super.key,
      required this.src,
      required this.height,
      required this.width});
  final String src;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      height: height,
      width: width,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          height: height,
          width: width,
          child: const CircularLoadingWidget(isSaloon: true),
        );
      },
    );
  }
}
