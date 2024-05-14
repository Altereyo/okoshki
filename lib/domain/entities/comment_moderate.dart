class CommentModerate {
  final String text;
  final String status;
  final String updated;

  const CommentModerate({
    required this.text,
    required this.status,
    required this.updated,
  });

  @override
  String toString() {
    return 'CommentModerate{text: $text, status: $status}';
  }
}