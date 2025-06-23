import 'package:majjora_store/repository/rating_local_repository.dart';

class RatingRepository {
  final RatingLocalRepository ratingLocalRepository;

  // Recebe o repositório local
  RatingRepository(this.ratingLocalRepository);

  // Salva uma avaliação
  Future<void> saveRating(
    int userId,
    int productId,
    double rate,
    int count,
  ) async {
    await ratingLocalRepository.saveRating(userId, productId, rate, count);
  }

  // Busca avaliação por usuário e produto
  Future<List<Map<String, dynamic>>> getRatingByUserIdAndProductId(
    int userId,
    int productId,
  ) async {
    return await ratingLocalRepository.getRatingByUserIdAndProductId(
      userId,
      productId,
    );
  }

  // Busca avaliação por produto
  Future<List<Map<String, dynamic>>> getRatingByProductId(int productId) async {
    return await ratingLocalRepository.getRatingByProductId(productId);
  }

  // Remove uma avaliação
  Future<void> removeRating(int userId, int productId) async {
    await ratingLocalRepository.removeRating(userId, productId);
  }
}
