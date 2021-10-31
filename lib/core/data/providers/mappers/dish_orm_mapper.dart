import 'package:food_ninja/core/data/providers/orm_model/dish/dish_orm.dart';

class DishOrmMapper {
  DishOrm fromDefault(Map<String, dynamic> map) {
    final Set<String> requiredFields = {'id', 'name'};
    requiredFields.forEach((field) {
      if(map[field] == null) {

      }
    });


    final priceValue = map['price'];
    final double? price = priceValue is int ? priceValue.toDouble() : priceValue;

    return DishOrm(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: price,
      previewImage: map['preview_image'],
      detailImage: map['detail_image'],
      rating: map['rating'],
      isPopular: map['is_popular'],
      ordersQuantity: map['orders_quantity'],
      restaurantId: map['restaurant'] != null ? map['restaurant']['id'] : null
    );
  }
}