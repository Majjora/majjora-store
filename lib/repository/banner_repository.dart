import './../models/models.dart';
import './../repository/repository.dart';

class BannerRepository {
  final BannerRemoteRepository bannerRemoteRepository;

  // Recebe o repositório remoto
  BannerRepository(this.bannerRemoteRepository);

  // Busca os banners
  Future<List<BannerModel>> fetchBanners() async {
    return await bannerRemoteRepository.fetchBanners();
  }
}
