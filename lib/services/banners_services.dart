import 'dart:convert'; // Para decodificar JSON
import 'dart:math'; // Para embaralhar a lista
import 'package:http/http.dart' as http; // Para fazer requisições HTTP

import './../common/common.dart'; // Importa a classe HttpBase (onde tem a baseUrl)
import './../models/models.dart'; // Importa o ProductModel

// Pega até 4 banners aleatórios
class BannersServices {
  Future<List<BannerModel>> fetchBanners({int maxBanners = 4}) async {
    final response = await http.get(Uri.parse('${HttpBase.baseUrl}/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<ProductModel> products = data
          .map((json) => ProductModel.fromJson(json))
          .toList();
      products.shuffle(Random());
      final selectedProducts = products.take(maxBanners).toList();

      return selectedProducts.map((product) {
        return BannerModel(
          id: product.id,
          title: product.title,
          price: product.price,
          imageUrl: product.image,
        );
      }).toList();
    } else {
      throw Exception(
        'Erro ao Carregar os produtos para o banner: ${response.statusCode}',
      );
    }
  }
}
