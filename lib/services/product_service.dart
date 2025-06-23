import 'dart:convert'; // Para decodificar JSON

import 'package:http/http.dart' as http; // Para fazer requisições HTTP

import './../common/common.dart'; // Importa a classe HttpBase (onde tem a baseUrl)
import './../models/models.dart'; // Importa o ProductModel

// Busca todos os produtos
class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse('${HttpBase.baseUrl}/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao Carregar os produtos: ${response.statusCode}');
    }
  }

  // Busca um produto pelo id
  Future<ProductModel> fetchProductsById(int id) async {
    final response = await http.get(
      Uri.parse('${HttpBase.baseUrl}/products/$id'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return ProductModel.fromJson(data);
    } else {
      throw Exception(
        'Erro ao Carregar o produto com id: $id - statusCode: ${response.statusCode}',
      );
    }
  }

  // Busca produtos por categoria
  Future<List<ProductModel>> fetchProductsByCategory(String category) async {
    final response = await http.get(
      Uri.parse('${HttpBase.baseUrl}/products/category/$category'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception(
        'Erro ao Carregar os produtos das categorias: $category - StatusCode: ${response.statusCode}',
      );
    }
  }
}
