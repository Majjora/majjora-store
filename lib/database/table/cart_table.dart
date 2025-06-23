import 'package:majjora_store/models/cart_model.dart';
import 'package:majjora_store/models/cart_product_model.dart';

import '../database.dart';
import 'package:sqflite/sqlite_api.dart';

// Salva um novo carrinho com o userId e a data
class CartTable {
  Future<int> saveCart(int userId, String date) async {
    final db = await AppDatabase().database;
    return await db.insert('cart', {
      'userId': userId,
      'date': date,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Busca um carrinho por id e retorna junto com os produtos dele
  Future<CartModel?> getCartById(int cartId) async {
    return AppDatabase().database.then((db) async {
      // Pega o carrinho
      final List<Map<String, dynamic>> maps = await db.query(
        'cart',
        where: 'id = ?',
        whereArgs: [cartId],
      );
      if (maps.isNotEmpty) {
        final cartMap = maps.first;

        // Pega os produtos do carrinho
        final productMaps = await db.query(
          'cart_products',
          where: 'cartId = ?',
          whereArgs: [cartId],
        );

        // Converte os produtos para a lista correta
        final products = productMaps
            .map((map) => CartProductModel.fromjson(map))
            .toList();

        // Monta o CartModel
        return CartModel(
          id: cartMap['id'] as int,
          userId: cartMap['userId'] as int,
          date: DateTime.parse(cartMap['date'] as String),
          products: products,
        );
      }
      return null;
    });
  }

  // Deleta um carrinho por id
  Future<void> deleteCart(int cartId) async {
    final db = await AppDatabase().database;
    await db.delete('cart', where: 'id = ?', whereArgs: [cartId]);
  }

  // Remove um produto do carrinho
  Future<void> removeCartProduct(int cartId, int productId) async {
    final db = await AppDatabase().database;

    await db.delete(
      'cart_products',
      where: 'CartId = ? AND productId = ?',
      whereArgs: [cartId, productId],
    );
  }
}
