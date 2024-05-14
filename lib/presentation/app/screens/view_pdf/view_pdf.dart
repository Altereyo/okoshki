import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/screens/view_pdf/view_pdf_controller.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';

@RoutePage()
class ViewPDFScreen extends StatelessWidget {
  const ViewPDFScreen({
    Key? key,
    required this.url,
    required this.title,
    required this.isSaveButton,
  }) : super(key: key);
  final String url;
  final String title;
  final bool isSaveButton;
  @override
  Widget build(BuildContext context) {
    final controller =sl<ViewPDFController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const PDF(
            pageFling: false,
          ).fromUrl(
            url,
            placeholder: (progress) =>
                const CircularLoadingWidget(isSaloon: true),
            errorWidget: (error) => const CircularLoadingWidget(isSaloon: true),
          ),
          isSaveButton
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ButtonSaloon.large(
                    title: 'Скачать документ',
                    onPressed: () async => controller.openInBrowser(url),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
