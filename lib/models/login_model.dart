// Modelo para requisição de login, contendo nome de usuário e senha.
class LoginRequestModel {
  final String username;
  final String password;

  LoginRequestModel({required this.username, required this.password});

  // Converte os dados de login para JSON.
  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}

// Modelo para resposta de login, contendo o token de autenticação.
class LoginResponseModel {
  final String token;

  LoginResponseModel({required this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(token: json['token']);
  }

  // Converte o token para JSON.
  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}
