import 'package:food_ninja/core/domain/entities/banner/response/banner_base_response.dart';

class GetMainBannerResponse extends BannerBaseResponse {
  String url;

  GetMainBannerResponse(this.url);
}