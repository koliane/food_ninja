import 'package:dio/dio.dart' as dio;
import 'package:food_ninja/core/data/clients/api/api_client.dart';
import 'package:food_ninja/core/domain/entities/banner/request/get_main_banner_request.dart';
import 'package:food_ninja/core/domain/entities/banner/response/get_main_banner_response.dart';
import 'package:food_ninja/core/data/providers/skeleton/base_provider.dart';
import 'package:food_ninja/core/domain/entities/banner/request/banner_base_request.dart';
import 'package:food_ninja/core/domain/entities/banner/response/banner_base_response.dart';
import 'package:food_ninja/core/domain/entities/banner/port/provider/banner_provider_port.dart';

enum BannerProviderActionsEnum {
    getMainBanner,

}

class BannerProvider extends BaseProvider implements BannerProviderPort {
  final BannerProviderActionsEnum _operation;
  const BannerProvider.getMainBanner(): _operation = BannerProviderActionsEnum.getMainBanner;


  Future<GetMainBannerResponse> getMainBanner(GetMainBannerRequest request) async {
    final dio.Response httpResponse = await ApiClient().getBanner();

    final Map<String, dynamic> responseMap = httpResponse.data;
    final String url = responseMap['url'] ?? '';

    return GetMainBannerResponse(url);
  }
  Future<BannerBaseResponse> send(BannerBaseRequest request) async {
    switch(_operation) {
      case BannerProviderActionsEnum.getMainBanner:
        return getMainBanner(request as GetMainBannerRequest);
      
    }
  }
}