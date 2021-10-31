import 'package:food_ninja/core/domain/entities/restaurant/model/restaurant.dart';

import '../../skeleton/model/base_model.dart';

class Dish extends BaseModel {
  final int? id;
  final String? name;
  final String? description;
  final String? previewImage;
  final String? detailImage;
  final double? price;
  final double? rating;
  final bool? isPopular;
  final int? ordersQuantity;
  final int? restaurantId;
  bool? isFavorite;
  Restaurant? restaurant;

  Dish({
    required this.id,
    required this.name,
    this.description = '',
    this.previewImage,
    this.detailImage,
    this.price,
    this.rating,
    this.isPopular = false,
    this.isFavorite = false,
    this.ordersQuantity,
    this.restaurantId,
  });
}