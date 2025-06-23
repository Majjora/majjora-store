import 'package:majjora_store/database/table/favorite_table.dart';
import 'package:majjora_store/database/table/table.dart';
import 'package:majjora_store/models/cart_model.dart';

// Salva um carrinho no banco de dados
class CartLocalRepository {
  Future<void> saveCart(int userId, String date) async {
    final cartTable = CartTable();
    cartTable.saveCart(userId, date);
  }

  // Busca um carrinho pelo ID
  Future<CartModel?> getCartById(int cartId) async {
    final cartTable = CartTable();
    return cartTable.getCartById(cartId);
  }

  // Deleta um carrinho pelo ID
  Future<void> deleteCart(int cartId) async {
    final cartTable = CartTable();
    return cartTable.deleteCart(cartId);
  }

  // Remove um produto de um carrinho
  Future<void> removeCartProduct(int cartId, int productId) async {
    final cartTable = CartTable();
    return cartTable.removeCartProduct(cartId, productId);
  }
}
