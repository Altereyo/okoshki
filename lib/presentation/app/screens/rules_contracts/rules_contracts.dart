import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/domain/entities/app_document.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/presentation/app/screens/rules_contracts/rules_contracts_controller.dart';
import 'package:okoshki/presentation/app/widgets/list_tile_app.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';

@RoutePage()
class RulesContractsScreen extends StatelessWidget {
  const RulesContractsScreen({super.key, required this.isSaloon});
  final bool isSaloon;
  @override
  Widget build(BuildContext context) {
    final controller = sl<RulesContractsController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Правила и соглашения'),
      ),
      body: Observer(
        builder: (_) => controller.isLoading
            ? CircularLoadingWidget(
                isSaloon: isSaloon,
              )
            : ViewScreen(
                appDocumentsList: isSaloon
                    ? controller.appDocumentsSaloonList
                    : controller.appDocumentsCustomerList,
              ),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key, required this.appDocumentsList});
  final List<AppDocument> appDocumentsList;

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: appDocumentsList.length,
      itemBuilder: (context, index) {
        final appDoc = appDocumentsList[index];
        return ListTileApp(
          title: appDoc.title,
          isSaloon: null,
          onTap: () => appRouter.push(
            ViewPDFRoute(
              url: appDoc.documentFile,
              title: appDoc.title,
              isSaveButton: false,
            ),
          ),
        );
      },
    );
  }
}
