import 'dart:convert'; // Para decodificar JSON
import 'package:http/http.dart' as http; // Para fazer requisições HTTP

import './../common/common.dart'; // Importa a classe HttpBase (onde tem a baseUrl)
import './../models/models.dart'; // Importa o ProductModel

// Busca todos os carrinhos
class CartService {
  Future<List<CartModel>> fetchCarts() async {
    final response = await http.get(Uri.parse('${HttpBase.baseUrl}/carts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => CartModel.fromjson(json)).toList();
    } else {
      throw Exception('Erro ao carregar os carrinhos: ${response.statusCode}');
    }
  }

  // Busca um carrinho pelo id
  Future<CartModel> fetchCartsById(int id) async {
    final response = await http.get(Uri.parse('${HttpBase.baseUrl}/carts/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return CartModel.fromjson(data);
    } else {
      throw Exception(
        'Erro ao carregar o carrinho com id: $id - StatusCode: ${response.statusCode}',
      );
    }
  }
}
