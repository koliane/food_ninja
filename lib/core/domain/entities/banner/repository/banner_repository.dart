import 'package:food_ninja/core/domain/entities/banner/request/get_main_banner_request.dart';
import 'package:food_ninja/core/domain/entities/banner/response/get_main_banner_response.dart';

import 'package:food_ninja/core/domain/entities/banner/port/provider/banner_provider_port.dart';
import 'package:food_ninja/core/infrastructure/di/provider_di.dart';
import '../../skeleton/repository/base_repository.dart';



class BannerRepository extends BaseRepository{
  const BannerRepository();

    
  Future<String> getMainBanner() async {
    final BannerProviderPort provider = ProviderDi.getBannerGetMainBannerProvider();
    final GetMainBannerRequest request = GetMainBannerRequest();
    final GetMainBannerResponse response = await provider.send(request) as GetMainBannerResponse;

    return response.url;
  }

}

