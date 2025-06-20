class ChinneseFoodList {
  ChinneseFoodList({
    required this.id,
    required this.name,
    required this.restaurant,
    required this.web,
    required this.description,
    required this.ingredients,
    required this.addresses,
  });

  final int? id;
  final String? name;
  final String? restaurant;
  final String? web;
  final String? description;
  final List<String> ingredients;
  final List<Address> addresses;

  ChinneseFoodList copyWith({
    int? id,
    String? name,
    String? restaurant,
    String? web,
    String? description,
    List<String>? ingredients,
    List<Address>? addresses,
  }) {
    return ChinneseFoodList(
      id: id ?? this.id,
      name: name ?? this.name,
      restaurant: restaurant ?? this.restaurant,
      web: web ?? this.web,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      addresses: addresses ?? this.addresses,
    );
  }

  factory ChinneseFoodList.fromJson(Map<String, dynamic> json) {
    return ChinneseFoodList(
      id: json["id"],
      name: json["name"],
      restaurant: json["restaurant"],
      web: json["web"],
      description: json["description"],
      ingredients: json["ingredients"] == null
          ? []
          : List<String>.from(json["ingredients"]!.map((x) => x)),
      addresses: json["addresses"] == null
          ? []
          : List<Address>.from(
              json["addresses"]!.map((x) => Address.fromJson(x)),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "restaurant": restaurant,
    "web": web,
    "description": description,
    "ingredients": ingredients.map((x) => x).toList(),
    "addresses": addresses.map((x) => x.toJson()).toList(),
  };
}

class Address {
  Address({
    required this.addressAddressId,
    required this.number,
    required this.line1,
    required this.line2,
    required this.postcode,
    required this.country,
    required this.addressId,
  });

  final int? addressAddressId;
  final String? number;
  final String? line1;
  final String? line2;
  final String? postcode;
  final String? country;
  final int? addressId;

  Address copyWith({
    int? addressAddressId,
    String? number,
    String? line1,
    String? line2,
    String? postcode,
    String? country,
    int? addressId,
  }) {
    return Address(
      addressAddressId: addressAddressId ?? this.addressAddressId,
      number: number ?? this.number,
      line1: line1 ?? this.line1,
      line2: line2 ?? this.line2,
      postcode: postcode ?? this.postcode,
      country: country ?? this.country,
      addressId: addressId ?? this.addressId,
    );
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressAddressId: json["addressId"],
      number: json["number"],
      line1: json["line1"],
      line2: json["line2"],
      postcode: json["postcode"],
      country: json["country"],
      addressId: json["addressID"],
    );
  }

  Map<String, dynamic> toJson() => {
    "addressId": addressAddressId,
    "number": number,
    "line1": line1,
    "line2": line2,
    "postcode": postcode,
    "country": country,
    "addressID": addressId,
  };
}
