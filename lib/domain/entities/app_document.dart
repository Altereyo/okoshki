class AppDocument {
  final int id;
  final String title;
  final String documentFile;

  const AppDocument({
    required this.id,
    required this.title,
    required this.documentFile,
  });

  @override
  String toString() {
    return 'AppDocument{id: $id, title: $title, documentFile: $documentFile}';
  }
}