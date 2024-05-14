import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/screens/terms_of_service/terms_of_service_controller.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';

@RoutePage()
class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final controller = sl<TermsOfServiceController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Условия сервиса'),
      ),
      body:  Observer(
        builder: (_) => controller.isLoading
            ? const CircularLoadingWidget(isSaloon: false)
            : const ViewScreen(),
      ),
    );
  }
}
class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<TermsOfServiceController>();
    return controller.appDocumentTermsOfService != null
        ? const PDF(
            pageFling: false,
          ).fromUrl(
            controller.appDocumentTermsOfService!.documentFile,
            placeholder: (progress) =>
                const CircularLoadingWidget(isSaloon: false),
            errorWidget: (error) =>
                const CircularLoadingWidget(isSaloon: false),
          )
        : const Center(
            child: Text('Такого документа нет'),
          );
  }
}