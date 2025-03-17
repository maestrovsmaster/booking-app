import 'dart:ffi';

class Service {
  final String name;
  final Float price;
  final String? description;
  final bool available;

  Service({
    required this.name,
    required this.price,
    required this.description,
    required this.available,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      name: json['name'] ?? '',
      price: json['price'] ?? 0.0,
      description: json['description'] ?? '',
      available: json['available'] ?? false,
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'available': available,
    };
  }

  Service copyWith({
    String? name,
    Float? price ,
    String? description,
    String? available,
  }) {
    return Service(
      name: this.name,
      price: this.price,
      description: description ?? this.description,
      available: this.available,
    );
  }
}

