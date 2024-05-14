class IntroSlide {
  final int id;
  final String title;
  final String text;
  final String slide;
  final int order;

  const IntroSlide({
    required this.id,
    required this.title,
    required this.text,
    required this.slide,
    required this.order,
  });

  @override
  String toString() {
    return 'IntroSlide{id: $id, title: $title, text: $text, slide: $slide, order: $order}';
  }
}