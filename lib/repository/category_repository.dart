import './../repository/repository.dart';

class CategoryRepository {
  // Recebe o repositório remoto
  final CategoryRemoteRepository categoryRemoteRepository;
  CategoryRepository(this.categoryRemoteRepository);
  // Pega as categorias
  Future<List<String>> fetchCategories() async {
    return await categoryRemoteRepository.fetchCategories();
  }
}
