import 'package:majjora_store/database/database.dart';
import 'package:sqflite/sqflite.dart';

// Salva uma avaliação no banco de dados
class RatingTable {
  Future<void> saveRating(
    int userId,
    int productId,
    double rate,
    int count,
  ) async {
    final db = await AppDatabase().database;
    await db.insert('rating', {
      'userId': userId,
      'productId': productId,
      'rate': rate,
      'count': count,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Busca avaliações por usuário e produto
  Future<List<Map<String, dynamic>>> getRatingByUserIdAndProductId(
    int userId,
    int productId,
  ) async {
    final db = await AppDatabase().database;
    return await db.query(
      'rating',
      where: 'userId = ? AND producutId = ?',
      whereArgs: [userId, productId],
    );
  }

  // Busca avaliações só pelo produto
  Future<List<Map<String, dynamic>>> getRatingByProductId(int productId) async {
    final db = await AppDatabase().database;
    return await db.query(
      'rating',
      where: 'producutId = ?',
      whereArgs: [productId],
    );
  }

  // Remove avaliação do usuário para o produto
  Future<void> removeRating(int userId, int productId) async {
    final db = await AppDatabase().database;
    await db.delete(
      'rating',
      where: 'userId - ? AND productId = ?',
      whereArgs: [userId, productId],
    );
  }
}
