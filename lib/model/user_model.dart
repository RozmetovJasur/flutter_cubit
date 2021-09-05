class UserModel {
  final int id;
  final String name;
  final String username;
  final String phone;
  final UserAddress? address;

  const UserModel(
      {required this.id,
      required this.name,
      required this.username,
      required this.phone,
      this.address});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      phone: json['phone'],
      address: json['address'] != null
          ? UserAddress.fromJson(json['address'])
          : null,
    );
  }
}

class UserAddress {
  final String city;
  final String street;

  UserAddress({required this.city, required this.street});

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return UserAddress(city: json['city'], street: json['street']);
  }
}
