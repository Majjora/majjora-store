import 'package:majjora_store/models/cart_model.dart';
import 'package:majjora_store/models/cart_product_model.dart';
import 'package:majjora_store/repository/cart_local_repository.dart';
import 'package:majjora_store/repository/cart_products_local_repository.dart';

class CartRepository {
  final CartLocalRepository cartLocalRepository;
  final CartProductsLocalRepository cartProductsLocalRepository;

  CartRepository(this.cartLocalRepository, this.cartProductsLocalRepository);

  // Salva um carrinho com o userId e data
  Future<void> saveCart(int userId, String date) async {
    cartLocalRepository.saveCart(userId, date);
  }

  // Busca um carrinho pelo ID
  Future<CartModel?> getCartById(int cartId) async {
    return cartLocalRepository.getCartById(cartId);
  }

  // Deleta um carrinho pelo ID
  Future<void> deleteCart(int cartId) async {
    return cartLocalRepository.deleteCart(cartId);
  }

  // Remove um produto específico de um carrinho
  Future<void> removeCartProduct(int cartId, int productId) async {
    return cartLocalRepository.removeCartProduct(cartId, productId);
  }

  // Salva um produto no carrinho
  Future<void> saveCartProduct(int userId, CartProductModel cartProduct) async {
    cartProductsLocalRepository.saveCartProduct(userId, cartProduct);
  }

  // Remove todos os produtos de um carrinho pelo ID
  Future<void> removeCartProductByCartId(int cartId) async {
    return cartProductsLocalRepository.removeCartProductByCartId(cartId);
  }

  // Retorna todos os produtos do carrinho de um usuário
  Future<List<CartProductModel>> getCartProducts(int userId) async {
    return cartProductsLocalRepository.getCartProducts(userId);
  }
}
