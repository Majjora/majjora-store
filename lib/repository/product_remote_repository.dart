import './../services/service.dart'; // Usa o ProductService
import './../models/models.dart'; // Usa o ProductModel

class ProductRemoteRepository {
  final ProductService productService;

  // Recebe o serviço que busca os dados
  ProductRemoteRepository(this.productService);

  // Pega todos os produtos
  Future<List<ProductModel>> getProducts() async {
    try {
      return await productService.fetchProducts();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Pega um produto pelo id
  Future<ProductModel> getProductById(int id) async {
    try {
      return await productService.fetchProductsById(id);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Pega produtos por categoria
  Future<List<ProductModel>> getProductByCategoty(String category) async {
    try {
      return await productService.fetchProductsByCategory(category);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
