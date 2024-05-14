class HelpTip {
  final int id;
  final String question;
  final String answer;
  final int order;

  const HelpTip({
    required this.id,
    required this.question,
    required this.answer,
    required this.order,
  });

  @override
  String toString() {
    return 'HelpTip{id: $id, question: $question, answer: $answer, order: $order}';
  }
}