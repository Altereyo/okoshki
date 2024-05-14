class UserProfile {
  final int id;
  final String? username;
  final String? email;
  final String firstName;
  final String lastName;
  final String? phoneNumber;
  final dynamic patronymic;
  final List<int> favoriteSalons;
  final int? targetCity;
  final String? detail;
  final bool salonsOwner;

  const UserProfile({
      required this.id,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.patronymic,
      required this.phoneNumber,
      required this.favoriteSalons,
      required this.targetCity,
      required this.detail,
      required this.salonsOwner,
  });
}