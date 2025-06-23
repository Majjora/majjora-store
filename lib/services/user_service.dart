import 'dart:convert'; // Para decodificar JSON
import 'package:http/http.dart' as http; // Para fazer requisições HTTP

import './../common/common.dart'; // Importa a classe HttpBase (onde tem a baseUrl)
import './../models/models.dart'; // Importa o ProductModel

// Pega todos os usuários
class UserService {
  Future<List<UserModel>> fechUsers() async {
    final response = await http.get(Uri.parse('${HttpBase.baseUrl}/users'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar os usuários: ${response.statusCode}');
    }
  }

  // Pega um usuário pelo id
  Future<UserModel> fecthUserById(int id) async {
    final response = await http.get(Uri.parse('${HttpBase.baseUrl}/users/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception(
        'Erro ao carregar o usuário com o id $id - StatusCode: ${response.statusCode}',
      );
    }
  }
}
