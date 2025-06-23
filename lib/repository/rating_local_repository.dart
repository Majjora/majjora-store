import '../database/table/table.dart';

// Salva a avaliação chamando o método da tabela
class RatingLocalRepository {
  saveRating(int userId, int productId, double rate, int count) async {
    final ratingTable = RatingTable();
    await ratingTable.saveRating(userId, productId, rate, count);
  }

  // Busca avaliações por usuário e produto
  Future<List<Map<String, dynamic>>> getRatingByUserIdAndProductId(
    int userId,
    int productId,
  ) async {
    final ratingTable = RatingTable();
    return await ratingTable.getRatingByUserIdAndProductId(userId, productId);
  }

  // Busca avaliações por produto
  Future<List<Map<String, dynamic>>> getRatingByProductId(int productId) async {
    final ratingTable = RatingTable();
    return await ratingTable.getRatingByProductId(productId);
  }

  // Remove uma avaliação específica
  removeRating(int userId, int productId) async {
    final ratingTable = RatingTable();
    await ratingTable.removeRating(userId, productId);
  }
}
