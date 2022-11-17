import 'dart:convert';

class User {
  final String name;
  final String? carId;

  User({
    required this.name,
    this.carId,
  });

  User copyWith({
    String? name,
    String? carId,
  }) {
    return User(
      name: name ?? this.name,
      carId: carId ?? this.carId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'carId': carId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      carId: map['carId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, carId: $carId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.carId == carId;
  }

  @override
  int get hashCode => name.hashCode ^ carId.hashCode;
}
