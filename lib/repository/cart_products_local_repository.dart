import './../database/table/table.dart';
import './../models/models.dart';

// Salva um produto no carrinho
class CartProductsLocalRepository {
  Future<void> saveCartProduct(int userId, CartProductModel cartProduct) async {
    final cartTable = CartProductTable();
    cartTable.saveCartProduct(userId, cartProduct);
  }

  // Busca os produtos que estão em um carrinho
  Future<List<CartProductModel>> getCartProducts(int cartId) async {
    final cartTable = CartProductTable();
    return cartTable.getCartProducts(cartId);
  }

  // Remove todos os produtos de um carrinho pelo ID do carrinho
  Future<void> removeCartProductByCartId(int cartId) async {
    final cartTable = CartProductTable();
    return cartTable.removeCartProductByCartId(cartId);
  }
}
