
class BookingClient {
  final int id;
  final String username;
  final String phoneNumber;

  const BookingClient({
    required this.id,
    required this.username,
    required this.phoneNumber,
  });

  @override
  String toString() {
    return '$id $username $phoneNumber';
  }
}
