import 'package:food_ninja/core/domain/entities/banner/service/banner_service.dart';
import 'package:food_ninja/core/domain/entities/dish/model/dish.dart';
import 'package:food_ninja/core/domain/entities/dish/service/dish_service.dart';
import 'package:food_ninja/core/domain/entities/restaurant/model/restaurant.dart';
import 'package:food_ninja/core/domain/entities/restaurant/service/restaurant_service.dart';
import 'package:food_ninja/core/domain/entities/skeleton/collection/base_collection.dart';
import 'package:mobx/mobx.dart';

part 'main_page_state.g.dart';

class _MainPageState extends MainPageState with _$_MainPageState {

}

abstract class MainPageState with Store {
  @observable
  String bannerUrl = '';

  ObservableList<Restaurant> nearestRestaurants = ObservableList<Restaurant>.of([]);
  ObservableList<Dish> popularDishes = ObservableList<Dish>.of([]);

  factory MainPageState.create() => _MainPageState();
  MainPageState();

  @action
  Future<void> init() async {
    bannerUrl = await const BannerService().getMainBanner();

    final BaseCollection<Restaurant> restaurantsCollection = await const RestaurantService().getNearestRestaurants();
    nearestRestaurants.addAll(ObservableList<Restaurant>.of(restaurantsCollection.toList()));

    final BaseCollection<Dish> dishesCollection = await const DishService().getPopularDishes();
    popularDishes = ObservableList<Dish>.of(dishesCollection.toList());
  }
}