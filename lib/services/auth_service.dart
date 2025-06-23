import 'dart:convert'; // Para decodificar JSON
import 'package:http/http.dart' as http; // Para fazer requisições HTTP
import 'package:majjora_store/models/login_model.dart';

import './../common/common.dart'; // Importa a classe HttpBase (onde tem a baseUrl)
import './../models/models.dart'; // Importa o ProductModel

// Sistema de Login
class AuthService {
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    final response = await http.post(
      Uri.parse('${HttpBase.baseUrl}/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return LoginResponseModel.fromJson(data);
    } else {
      throw Exception(
        'Erro no login: Username ou Senha está incorreta: ${response.statusCode}',
      );
    }
  }
}
