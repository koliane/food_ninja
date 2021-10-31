import 'package:food_ninja/core/data/providers/orm_model/restaurant/restaurant_orm.dart';

class RestaurantOrmMapper {
  RestaurantOrm fromDefault(Map<String, dynamic> map) {
    Set<String> requiredFields = {'id', 'name'};
    requiredFields.forEach((field) {
      if(map[field] == null) {

      }
    });
    print(map);


    return RestaurantOrm(
      id: map['id'],
      name: map['name'],
      previewImage: map['preview_image'],
      detailImage: map['detail_image'],
      deliveryTime: map['delivery_time'],
      rating: map['rating'],
      isPopular: map['is_popular'],
    );
  }
}