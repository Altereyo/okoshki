import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/presentation/app/widgets/list_tile_app.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/saloon/screens/documents/documents_controller.dart';

@RoutePage()
class DocumentsSaloonScreen extends StatelessWidget {
  const DocumentsSaloonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<DocumentsSaloonController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Документы'),
      ),
      body: Observer(
        builder: (_) => controller.isLoading
            ? const CircularLoadingWidget(
                isSaloon: true,
              )
            : const ViewScreen(),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<DocumentsSaloonController>();
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: controller.saloonDocumentsList.length,
      itemBuilder: (context, index) {
        final saloonDoc = controller.saloonDocumentsList[index];
        return ListTileApp(
          title: saloonDoc.title,
          isSaloon: null,
          onTap: () {
            appRouter.push(
              ViewPDFRoute(
                url: saloonDoc.documentFile,
                title: saloonDoc.title,
                isSaveButton: true,
              ),
            );
          },
        );
      },
    );
  }
}
