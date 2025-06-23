import 'dart:convert'; // Para decodificar JSON
import 'package:http/http.dart' as http; // Para fazer requisições HTTP

import './../common/common.dart'; // Importa a classe HttpBase (onde tem a baseUrl)

// Busca todas as categorias
class CategoryService {
  Future<List<String>> fetchCategories() async {
    final response = await http.get(
      Uri.parse('${HttpBase.baseUrl}/products/categories'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((cat) => cat.toString()).toList();
    } else {
      throw Exception('Erro ao carregar as categorias: ${response.statusCode}');
    }
  }
}
