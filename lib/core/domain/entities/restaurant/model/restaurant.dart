import 'package:food_ninja/core/infrastructure/services/distance/distance.dart';

import '../../skeleton/model/base_model.dart';

class Restaurant extends BaseModel {
  final int id;
  final String name;
  final String? previewImage;
  final String? detailImage;
  final Duration? deliveryTime;
  final double? rating;
  final bool isPopular;
  bool isFavorite;
  Distance? distance;

  Restaurant({
    required this.id,
    required this.name,
    this.previewImage,
    this.detailImage,
    this.deliveryTime,
    this.rating,
    this.isPopular = false,
    this.isFavorite = false,
    this.distance,
  });
}