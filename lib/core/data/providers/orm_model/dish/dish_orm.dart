class DishOrm {
  final int id;
  final String name;
  final String? description;
  final double? price;
  final String? previewImage;
  final String? detailImage;
  final double? rating;
  final bool? isPopular;
  final int? ordersQuantity;
  final int? restaurantId;

  DishOrm({
    required this.id,
    required this.name,
    this.description,
    this.previewImage,
    this.detailImage,
    this.rating,
    this.isPopular,
    this.ordersQuantity,
    this.price,
    this.restaurantId,
  });
}