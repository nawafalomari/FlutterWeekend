import 'dart:convert';

class Car {
  final String name;
  Car({
    required this.name,
  });

  Car copyWith({
    String? name,
  }) {
    return Car(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source));

  @override
  String toString() => 'Car(name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Car && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
