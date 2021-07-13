class User {
  final String uid;
  final String? name;
  final String? photoUrl;
  final List<String>? favorites;

  User({
    required this.uid,
    this.name,
    this.photoUrl,
    this.favorites,
  });
}
