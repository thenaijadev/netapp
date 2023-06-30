class Product {
  Product(
      {required this.brand,
      this.competitionBrand,
      this.activation,
      this.competionAdditionalInformation,
      required this.sku,
      required this.category,
      required this.isAvailable,
      required this.isOutOfStock,
      required this.isNewListing,
      required this.price,
      required this.hasPriceChanged,
      required this.newPrice,
      required this.image});
  final String brand;
  final String sku;
  final String category;
  final bool isAvailable;
  final bool isOutOfStock;
  final bool isNewListing;
  final double price;
  final bool hasPriceChanged;
  final double newPrice;
  final String image;
  final String? competitionBrand;
  final String? activation;
  final String? competionAdditionalInformation;
}
