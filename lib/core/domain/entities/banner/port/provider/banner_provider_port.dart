import 'package:food_ninja/core/domain/entities/banner/request/banner_base_request.dart';
import 'package:food_ninja/core/domain/entities/banner/response/banner_base_response.dart';

abstract class BannerProviderPort {
  Future<BannerBaseResponse> send(covariant BannerBaseRequest request);
}