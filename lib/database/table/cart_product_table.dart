import 'package:majjora_store/models/cart_model.dart';
import 'package:majjora_store/models/cart_product_model.dart';

import '../database.dart';
import 'package:sqflite/sqlite_api.dart';

class CartProductTable {
  // Salva um produto no carrinho
  // Atualiza se já existir, senão insere um novo
  Future<void> saveCartProduct(int cartId, CartProductModel cartProduct) async {
    final db = await AppDatabase().database;
    final count = await db.update(
      'cart_products',
      {
        'productId': cartProduct.productId,
        'quantity': cartProduct.quantity,
        'title': cartProduct.title,
        'price': cartProduct.price,
        'imageUrl': cartProduct.imageUrl,
      },
      where: 'cartId = ? AND product = ?',
      whereArgs: [cartId, cartProduct.productId],
    );

    // Se não atualizou nada, insere novo
    if (count == 0) {
      await db.insert('cart_products', {
        'cartId': cartId,
        'productId': cartProduct.productId,
        'title': cartProduct.title,
        'quantity': cartProduct.quantity,
        'price': cartProduct.price,
        'imageUrl': cartProduct.imageUrl,
      });
    }
  }

  // Pega todos os produtos de um carrinho pelo ID
  Future<List<CartProductModel>> getCartProducts(int cartId) async {
    return AppDatabase().database.then((db) async {
      final List<Map<String, dynamic>> maps = await db.query(
        'cart_products',
        where: 'cartId = ?',
        whereArgs: [cartId],
      );
      return maps.map((map) => CartProductModel.fromjson(map)).toList();
    });
  }

  // Remove todos os produtos que pertencem a um carrinh
  Future<void> removeCartProductByCartId(int cartId) async {
    final db = await AppDatabase().database;

    await db.delete('cart_products', where: 'CartId = ?', whereArgs: [cartId]);
  }
}
