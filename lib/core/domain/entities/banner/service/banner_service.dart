import '../repository/banner_repository.dart';

class BannerService {
  const BannerService();

    
  Future<String> getMainBanner() async {
    return const BannerRepository().getMainBanner();
  }

}