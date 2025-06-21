// Modelo que representa a avaliação de um produto, contendo a nota (rate) e o número de avaliações (count).
class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  // Constrói um RatingModel a partir de um JSON.
  factory RatingModel.fromjson(Map<String, dynamic> json) {
    return RatingModel(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'],
    );
  }

  // Converte o RatingModel para JSON.
  Map<String, dynamic> tojson() {
    return {'rate': rate, 'count': count};
  }
}
