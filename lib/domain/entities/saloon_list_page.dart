import 'package:okoshki/domain/entities/saloon.dart';

class SaloonListPage {
  final bool isLastPage;
  final int page;
  final int numPages;
  final List<Saloon> results;

  SaloonListPage({
    required this.isLastPage,
    required this.page,
    required this.numPages,
    required this.results,
  });
}