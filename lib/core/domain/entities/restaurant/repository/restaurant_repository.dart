import 'package:food_ninja/core/data/providers/entities/restaurant/api/dish_restaurant_provider.dart';
import 'package:food_ninja/core/data/providers/orm_model/restaurant/restaurant_orm.dart';
import 'package:food_ninja/core/domain/entities/restaurant/model/restaurant.dart';
import 'package:food_ninja/core/domain/entities/restaurant/request/get_nearest_restaurants_request.dart';
import 'package:food_ninja/core/domain/entities/restaurant/request/restaurant_base_request.dart';
import 'package:food_ninja/core/domain/entities/restaurant/response/get_nearest_restaurants_response.dart';

import 'package:food_ninja/core/domain/entities/restaurant/port/provider/restaurant_provider_port.dart';
import 'package:food_ninja/core/domain/entities/restaurant/response/restaurants_response.dart';
import 'package:food_ninja/core/domain/entities/skeleton/collection/base_collection.dart';
import 'package:food_ninja/core/domain/entities/skeleton/request/base_request.dart';
import 'package:food_ninja/core/infrastructure/di/provider_di.dart';
import '../../skeleton/repository/base_repository.dart';



class RestaurantRepository extends BaseRepository{
  const RestaurantRepository();
    
  Future<BaseCollection<Restaurant>> getNearestRestaurants() async {
    final RestaurantProviderPort provider = ProviderDi.getRestaurantGetNearestRestaurantsProvider();
    final GetNearestRestaurantsRequest request = GetNearestRestaurantsRequest();
    final GetNearestRestaurantsResponse response = await provider.send(request) as GetNearestRestaurantsResponse;

    final BaseCollection<Restaurant> result = BaseCollection();
    final List<RestaurantOrm> list = response.list;
    list.forEach((element) {
      final Restaurant model = _createModelFromOrm(element);
      result.add(model);
    });

    return result;
  }

  Future<BaseCollection<Restaurant>> getPopularDishesRestaurants() async {
    final RestaurantProviderPort provider = DishRestaurantProvider.popular() as RestaurantProviderPort;
    final RestaurantsResponse response = await provider.send(RestaurantBaseRequest()) as RestaurantsResponse;

    final BaseCollection<Restaurant> result = BaseCollection();
    final List<RestaurantOrm> list = response.list;
    list.forEach((element) {
      final Restaurant model = _createModelFromOrm(element);
      result.add(model);
    });


    return result;
  }

  Restaurant _createModelFromOrm(RestaurantOrm dto) {
    return Restaurant(
      id: dto.id,
      name: dto.name,
      previewImage: dto.previewImage,
      detailImage: dto.detailImage,
      deliveryTime: Duration(seconds: dto.deliveryTime ?? 0),
      rating: dto.rating,
      isPopular: dto.isPopular ?? false,

    );
  }

}

