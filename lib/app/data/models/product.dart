// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  Product(
      {required this.channel,
      required this.brand,
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
      this.newPrice,
      this.image});
  final String brand;
  final String sku;
  final String category;
  final bool isAvailable;
  final bool isOutOfStock;
  final String channel;
  final bool isNewListing;
  final double price;
  final bool hasPriceChanged;
  final double? newPrice;
  final String? image;
  final String? competitionBrand;
  final String? activation;
  final String? competionAdditionalInformation;

  @override
  String toString() {
    return 'Product(brand: $brand, sku: $sku, category: $category, isAvailable: $isAvailable, isOutOfStock: $isOutOfStock, channel: $channel, isNewListing: $isNewListing, price: $price, hasPriceChanged: $hasPriceChanged, newPrice: $newPrice, image: $image, competitionBrand: $competitionBrand, activation: $activation, competionAdditionalInformation: $competionAdditionalInformation)';
  }
}
