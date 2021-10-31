import 'package:dio/dio.dart' as dio;
import 'package:food_ninja/core/data/clients/api/api_client.dart';
import 'package:food_ninja/core/data/providers/mappers/dish_orm_mapper.dart';
import 'package:food_ninja/core/data/providers/orm_model/dish/dish_orm.dart';
import 'package:food_ninja/core/data/providers/storage/popular_dishes_storage.dart';
import 'package:food_ninja/core/domain/entities/dish/request/get_popular_dishes_request.dart';
import 'package:food_ninja/core/domain/entities/dish/response/get_popular_dishes_response.dart';
import 'package:food_ninja/core/data/providers/skeleton/base_provider.dart';
import 'package:food_ninja/core/domain/entities/dish/request/dish_base_request.dart';
import 'package:food_ninja/core/domain/entities/dish/response/dish_base_response.dart';
import 'package:food_ninja/core/domain/entities/dish/port/provider/dish_provider_port.dart';

enum DishProviderActionsEnum {
    getPopularDishes,

}

class DishProvider extends BaseProvider implements DishProviderPort {
  final DishProviderActionsEnum _operation;
  const DishProvider.getPopularDishes(): _operation = DishProviderActionsEnum.getPopularDishes;

  Future<GetPopularDishesResponse> getPopularDishes(GetPopularDishesRequest request) async {
    final PopularDishesStorage storage = PopularDishesStorage();
    await storage.send(request);

    return GetPopularDishesResponse(storage.dishes);



    // final dio.Response httpResponse = await ApiClient().popularDishes();
    //
    // final List responseMap = httpResponse.data;
    //
    // print(responseMap);
    //
    // final List<DishOrm> resultList = responseMap.map((value) {
    //   return DishOrmMapper().fromDefault(value);
    // }).toList();
    //
    // return GetPopularDishesResponse(resultList);
  }

  Future<DishBaseResponse> send(DishBaseRequest request) async {
    switch(_operation) {
      case DishProviderActionsEnum.getPopularDishes:
        return getPopularDishes(request as GetPopularDishesRequest);
      
    }
  }
}