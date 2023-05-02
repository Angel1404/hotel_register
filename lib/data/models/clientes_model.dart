class ClienteModels {
  final int? id;
  final String filePdf;
  final String name;
  final String adress;
  final String city;
  final String country;
  final String phone;
  final String email;
  final String? createdAt;
  final String? updatedAt;

  ClienteModels({
    this.id,
    required this.filePdf,
    required this.name,
    required this.adress,
    this.createdAt,
    this.updatedAt,
    required this.city,
    required this.country,
    required this.phone,
    required this.email,
  });

  factory ClienteModels.fromJson(Map<String, dynamic> map) {
    return ClienteModels(
      filePdf: map['filePdf'],
      id: map['id'],
      adress: map['adress'],
      name: map['name'],
      city: map['city'],
      country: map['country'],
      email: map['email'],
      phone: map['phone'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  ClienteModels copyWith({
    int? id,
    String? filePdf,
    String? name,
    String? adress,
    String? city,
    String? country,
    String? phone,
    String? email,
    String? createdAt,
    String? updatedAt,
  }) =>
      ClienteModels(
        adress: adress ?? this.adress,
        city: city ?? this.city,
        country: country ?? this.country,
        email: email ?? this.email,
        filePdf: filePdf ?? this.filePdf,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "adress": adress,
      "name": name,
      "city": city,
      "country": country,
      "phone": phone,
      "email": email,
      "filePdf": filePdf,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  Map<String, dynamic> toMapInsert() {
    return {
      "adress": adress,
      "name": name,
      "city": city,
      "country": country,
      "phone": phone,
      "email": email,
      "filePdf": filePdf,
    };
  }
}
