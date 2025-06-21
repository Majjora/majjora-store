import 'package:majjora_store/models/models.dart';

// Modelo que representa um banner promocional, geralmente derivado de um produto.
class BannerModel {
  final int id;
  final String title;
  final double price;
  final String imageUrl;

  BannerModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  // Cria um BannerModel a partir de um ProductModel.
  factory BannerModel.fromProduct(ProductModel product) {
    return BannerModel(
      id: product.id,
      title: product.title,
      price: product.price,
      imageUrl: product.image,
    );
  }

  // Cria um BannerModel a partir de um JSON.
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image'],
    );
  }

  // Converte o BannerModel para JSON.
  Map<String, dynamic> tojson() {
    return {'id': id, 'title': title, 'price': price, 'imageUrl': imageUrl};
  }
}
