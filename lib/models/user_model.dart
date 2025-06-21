import 'package:majjora_store/models/models.dart';
import 'package:majjora_store/models/name_model.dart';

// Modelo que representa um usuário da aplicação, com dados como nome, email, endereço, etc.
class UserModel {
  final int id;
  final String email;
  final String username;
  final String password;
  final NameModel name;
  final AddressModel address;
  final String phone;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  // Cria um UserModel a partir de um JSON (deserialização)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      name: NameModel.fromjson(json['name']),
      address: AddressModel.fromJson(json['address']),
      phone: json['phone'],
    );
  }

  // Converte o UserModel para um JSON (serialização)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'name': name.toJson(),
      'address': address.toJson(),
      'phone': phone,
    };
  }
}
