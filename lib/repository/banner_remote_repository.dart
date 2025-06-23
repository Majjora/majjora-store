import './../services/service.dart';
import './../models/models.dart';

class BannerRemoteRepository {
  final BannersServices bannersServices;

  // Recebe o serviço que busca os banners
  BannerRemoteRepository(this.bannersServices);

  // Busca a lista de banners
  Future<List<BannerModel>> fetchBanners() async {
    return await bannersServices.fetchBanners();
  }
}
