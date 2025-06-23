import './../repository/repository.dart'; // Usa o repositório remoto
import './../models/models.dart'; // Usa o ProductModel

class ProductRepository {
  final ProductRemoteRepository productRemoteRepository;

  // Recebe o repositório remoto no construtor
  ProductRepository(this.productRemoteRepository);

  // Pega todos os produtos
  Future<List<ProductModel>> getProducts() async {
    try {
      return await productRemoteRepository.getProducts();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Pega um produto pelo id
  Future<ProductModel> getProductById(int id) async {
    try {
      return await productRemoteRepository.getProductById(id);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Pega produtos por categoria
  Future<List<ProductModel>> getProductByCategoty(String category) async {
    try {
      return await productRemoteRepository.getProductByCategoty(category);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
