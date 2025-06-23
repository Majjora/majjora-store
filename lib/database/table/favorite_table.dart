import 'package:majjora_store/database/database.dart';
import 'package:sqflite/sqflite.dart';

// Adiciona um favorito no banco dados
class FavoriteTable {
  Future<void> addFavorite(
    int userId,
    int productId,
    String dateFavorite,
  ) async {
    final db = await AppDatabase().database;
    await db.insert('favorite', {
      'userId': userId,
      'productId': productId,
      'dataFavorito': dateFavorite,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Remove um favorito
  Future<void> removeFavorite(int userId, int productId) async {
    final db = await AppDatabase().database;
    await db.delete(
      'favorite',
      where: 'userId - ? AND productId = ?',
      whereArgs: [userId, productId],
    );
  }

  // Pega todos os favoritos de um usuário
  Future<List<Map<String, dynamic>>> getFavoritesByUserId(int userId) async {
    final db = await AppDatabase().database;
    return await db.query('favorite', where: 'userId = ?', whereArgs: [userId]);
  }

  // Verifica se o produto já está favoritado
  Future<bool> isFavorite(int userId, int productId) async {
    final db = await AppDatabase().database;
    final result = await db.query(
      'favorite',
      where: 'userId = ? AND productId = ?',
      whereArgs: [userId, productId],
    );
    return result.isNotEmpty;
  }
}
