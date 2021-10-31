import 'package:dio/dio.dart' as dio;
import 'package:food_ninja/core/data/clients/api/api_client.dart';
import 'package:food_ninja/core/data/providers/mappers/restaurant_orm_mapper.dart';
import 'package:food_ninja/core/data/providers/orm_model/restaurant/restaurant_orm.dart';
import 'package:food_ninja/core/domain/entities/restaurant/request/get_nearest_restaurants_request.dart';
import 'package:food_ninja/core/domain/entities/restaurant/response/get_nearest_restaurants_response.dart';
import 'package:food_ninja/core/data/providers/skeleton/base_provider.dart';
import 'package:food_ninja/core/domain/entities/restaurant/request/restaurant_base_request.dart';
import 'package:food_ninja/core/domain/entities/restaurant/response/restaurant_base_response.dart';
import 'package:food_ninja/core/domain/entities/restaurant/port/provider/restaurant_provider_port.dart';

enum RestaurantProviderActionsEnum {
    getNearestRestaurants,
}


class RestaurantProvider extends BaseProvider implements RestaurantProviderPort {
  final RestaurantProviderActionsEnum _operation;
  const RestaurantProvider.getNearestRestaurants(): _operation = RestaurantProviderActionsEnum.getNearestRestaurants;

  Future<GetNearestRestaurantsResponse> getNearestRestaurants(GetNearestRestaurantsRequest request) async {

    final dio.Response httpResponse = await ApiClient().nearestRestaurants();
    final List responseMap = httpResponse.data;
    final List<RestaurantOrm> resultList = responseMap.map((value) {
      return RestaurantOrmMapper().fromDefault(value);
      // return RestaurantOrm.fromJson(value);
    }).toList();

    return GetNearestRestaurantsResponse(resultList);
  }

  Future<RestaurantBaseResponse> send(RestaurantBaseRequest request) async {
    switch(_operation) {
      case RestaurantProviderActionsEnum.getNearestRestaurants:
        return getNearestRestaurants(request as GetNearestRestaurantsRequest);
      
    }
  }
}