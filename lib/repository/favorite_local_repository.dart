import './../database/table/table.dart';

// Adiciona um favorito
class FavoriteLocalRepository {
  Future<void> addFavorite(
    int userId,
    int productId,
    String dateFavorite,
  ) async {
    final favoriteTable = FavoriteTable();
    favoriteTable.addFavorite(userId, productId, dateFavorite);
  }

  // Remove um favorito
  Future<void> removeFavorite(int userId, int productId) async {
    final favoriteTable = FavoriteTable();
    favoriteTable.removeFavorite(userId, productId);
  }

  // Pega os favoritos de um usuário
  Future<List<Map<String, dynamic>>> getFavoriteByUserId(int userId) async {
    final favoriteTable = FavoriteTable();
    return favoriteTable.getFavoritesByUserId(userId);
  }

  // Verifica se o produto já foi favoritado
  Future<bool> isFavorite(int userId, int productId) async {
    final favoriteTable = FavoriteTable();
    return favoriteTable.isFavorite(userId, productId);
  }
}
