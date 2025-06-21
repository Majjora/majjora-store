// Modelo que representa um produto no carrinho, com ID do produto e quantidade.
class CartProductModel {
  final int productId;
  final int quantity;

  CartProductModel({required this.productId, required this.quantity});

  // Cria um CartProductModel a partir de um JSON.
  factory CartProductModel.fromjson(Map<String, dynamic> json) {
    return CartProductModel(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  // Converte o CartProductModel para JSON.
  Map<String, dynamic> tojson() {
    return {'productId': productId, 'quantity': quantity};
  }
}
