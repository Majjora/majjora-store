// Modelo que representa um produto no carrinho, com ID do produto, quantidade, titulo, preço e imagem.
class CartProductModel {
  final int productId;
  final String title;
  final double price;
  final String imageUrl;
  final int quantity;

  CartProductModel({
    required this.productId,
    required this.quantity,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  // Cria um CartProductModel a partir de um JSON.
  factory CartProductModel.fromjson(Map<String, dynamic> json) {
    return CartProductModel(
      productId: json['productId'],
      quantity: json['quantity'],
      title: json['title'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }

  // Converte o CartProductModel para JSON.
  Map<String, dynamic> tojson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
