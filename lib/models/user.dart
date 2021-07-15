class User {
  final String id;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? userName;
  final String? photoUrl;
  final List<String>? favorites;

  User({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.userName,
    this.photoUrl,
    this.favorites,
  });
}
