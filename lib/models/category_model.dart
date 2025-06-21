// Modelo que representa uma categoria de produto, com nome e opções de cor e ícone.
class CategoryModel {
  final String name;
  final String? colorHex;
  final String? iconAsset;

  CategoryModel({required this.name, this.colorHex, this.iconAsset});

  // Cria uma categoria apenas com o nome.
  factory CategoryModel.fromName(String categoryname) {
    return CategoryModel(name: categoryname);
  }

  // Converte o CategoryModel para JSON.
  Map<String, dynamic> tojson() {
    return {'name': name, 'colorHex': colorHex, 'iconAsset': iconAsset};
  }
}
