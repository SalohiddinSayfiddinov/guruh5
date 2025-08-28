class User {
  final String id;
  final String name;
  final String lastname;
  final String city;

  const User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? "-1",
      name: json['name'] ?? '',
      lastname: json['lastname'] ?? '',
      city: json['city'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'lastname': lastname, 'city': city};
  }
}
