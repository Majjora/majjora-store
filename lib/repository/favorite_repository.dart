import 'package:majjora_store/repository/favorite_local_repository.dart';

class FavoriteRepository {
  final FavoriteLocalRepository localRepository;

  // Recebe o repositório local
  FavoriteRepository(this.localRepository);

  // Adiciona um favorito
  Future<void> addfavorite(int userId, int productId, String dateFavorite) {
    return localRepository.addFavorite(userId, productId, dateFavorite);
  }

  // Remove um favorito
  Future<void> removeFavorite(int userId, int productId) {
    return localRepository.removeFavorite(userId, productId);
  }

  // Pega todos os favoritos de um usuário
  Future<List<Map<String, dynamic>>> getFavoriteByUserId(int userId) {
    return localRepository.getFavoriteByUserId(userId);
  }

  // Verifica se o produto está favoritado
  Future<bool> isFavorite(int userId, int productId) {
    return localRepository.isFavorite(userId, productId);
  }
}
