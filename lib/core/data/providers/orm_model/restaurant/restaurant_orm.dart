class RestaurantOrm {
  final int id;
  final String name;
  final String? previewImage;
  final String? detailImage;
  final int? deliveryTime;
  final double? rating;
  final bool? isPopular;

  RestaurantOrm({
    required this.id,
    required this.name,
    this.previewImage,
    this.detailImage,
    this.deliveryTime,
    this.rating,
    this.isPopular = false
  });
}