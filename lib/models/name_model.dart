// Modelo que representa o nome de uma pessoa, com primeiro e último nome.
class NameModel {
  final String firstname;
  final String lastname;

  NameModel({required this.firstname, required this.lastname});

  // Cria um NameModel a partir de um JSON.
  factory NameModel.fromjson(Map<String, dynamic> json) {
    return NameModel(firstname: json['firstname'], lastname: json['lastname']);
  }

  // Converte o NameModel para JSON.
  Map<String, dynamic> toJson() {
    return {'firstname': firstname, 'lastname': lastname};
  }
}
