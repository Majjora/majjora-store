import './../services/service.dart';

class CategoryRemoteRepository {
  final CategoryService categoryService;

  // Recebe o service que faz a chamada na API
  CategoryRemoteRepository(this.categoryService);

  // Chama o service para pegar as categorias
  Future<List<String>> fetchCategories() async {
    return await categoryService.fetchCategories();
  }
}
