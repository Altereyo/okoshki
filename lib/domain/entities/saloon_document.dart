class SaloonDocument {
  final int id;
  final String title;
  final String? description;
  final String documentFile;

  const SaloonDocument({
    required this.id,
    required this.title,
    this.description,
    required this.documentFile,
  });

  @override
  String toString() =>
      'SaloonDocument{id: $id, title: $title, description: $description, documentFile: $documentFile}';
}
