class SearchItem {
  final String search;
  final String type;
  final String city;

  const SearchItem({
    required this.search,
    required this.type,
    required this.city,
  });

  @override
  String toString() {
    return 'SearchItem{search: $search, type: $type, city: $city,}';
  }
}