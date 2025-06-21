import './../models/models.dart';

// Modelo que representa um carrinho de compras, com ID, usuário, data e lista de produtos.
class CartModel {
  final int id;
  final int userId;
  final DateTime date;
  final List<CartProductModel> products;

  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  // Cria um CartModel a partir de um JSON, convertendo a data e a lista de produtos.
  factory CartModel.fromjson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products: (json['products'] as List<dynamic>)
          .map((item) => CartProductModel.fromjson(item))
          .toList(),
    );
  }

  // Converte o CartModel para JSON, transformando a data em string e serializando os produtos.
  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'userId': userId,
      'date': date.toIso8601String(),
      'products': products.map((item) => item.tojson()).toList(),
    };
  }
}
