import 'package:food_ninja/core/data/providers/orm_model/dish/dish_orm.dart';
import 'package:food_ninja/core/domain/entities/dish/model/dish.dart';
import 'package:food_ninja/core/domain/entities/dish/request/get_popular_dishes_request.dart';
import 'package:food_ninja/core/domain/entities/dish/response/get_popular_dishes_response.dart';

import 'package:food_ninja/core/domain/entities/dish/port/provider/dish_provider_port.dart';
import 'package:food_ninja/core/domain/entities/restaurant/model/restaurant.dart';
import 'package:food_ninja/core/domain/entities/restaurant/service/restaurant_service.dart';
import 'package:food_ninja/core/domain/entities/skeleton/collection/base_collection.dart';
import 'package:food_ninja/core/infrastructure/di/provider_di.dart';
import '../../skeleton/repository/base_repository.dart';

class DishRepository extends BaseRepository{
  bool _withRestaurant = false;

  DishRepository();

  Future<BaseCollection<Dish>> getPopularDishes() async {
    final DishProviderPort provider = ProviderDi.getDishGetPopularDishesProvider();
    final GetPopularDishesRequest request = GetPopularDishesRequest();
    final GetPopularDishesResponse response = await provider.send(request) as GetPopularDishesResponse;

    final BaseCollection<Dish> dishes = BaseCollection();
    final List<DishOrm> list = response.list;
    list.forEach((element) {
      final Dish model = _createModelFromOrm(element);
      dishes.add(model);
    });

    if(_withRestaurant) {
      final BaseCollection<Restaurant> restaurantCollection = await const RestaurantService().getPopularDishesRestaurants();
      for(final Dish dish in dishes) {
        for(final Restaurant restaurant in restaurantCollection) {
          if(dish.restaurantId == restaurant.id) {
            dish.restaurant = restaurant;
            break;
          }
        }
      }
    }

    return dishes;
  }


  DishRepository withRestaurant() {
    _withRestaurant = true;
    return this;
  }


  Dish _createModelFromOrm(DishOrm dto) {
    return Dish(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      previewImage: dto.previewImage,
      detailImage: dto.detailImage,
      ordersQuantity: dto.ordersQuantity,
      rating: dto.rating,
      isPopular: dto.isPopular,
      restaurantId: dto.restaurantId,
      price: dto.price
    );
  }
}

