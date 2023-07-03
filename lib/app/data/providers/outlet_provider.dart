import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/data/models/product.dart';

class OutletNotifier extends StateNotifier<Outlet> {
  Outlet? _outlet;

  OutletNotifier() : super(Outlet());

  Outlet? get outlet => _outlet;

  final List<Product> _products = [];
  final List<Outlet> _outlets = [];

  List<Outlet> get outlets => _outlets;

  List<Product> get products => _products;

  void createOutlet(
      {required date,
      required capturedBy,
      required latitude,
      required longitude,
      required name,
      required address,
      required state,
      required city,
      required region,
      required channel,
      required subChannel,
      required managerName,
      required managerPhoneNumber,
      required supplier}) {
    _outlet = Outlet(
        date: date,
        capturedBy: capturedBy,
        latitude: latitude,
        longitude: longitude,
        name: name,
        address: address,
        state: state,
        city: city,
        region: region,
        channel: channel,
        subChannel: subChannel,
        managerName: managerName,
        managerPhoneNumber: managerPhoneNumber,
        supplier: supplier);

    print(_outlet.toString());
    state = _outlet;
  }

  void addProductToList(
      {brand,
      sku,
      category,
      isAvailable,
      isOutOfStock,
      isNewListing,
      price,
      hasPriceChanged,
      newPrice,
      image}) {
    final Product product = Product(
        brand: brand,
        sku: sku,
        category: category,
        isAvailable: isAvailable,
        isOutOfStock: isOutOfStock,
        isNewListing: isNewListing,
        price: price,
        hasPriceChanged: hasPriceChanged,
        newPrice: newPrice,
        image: image);

    products.add(product);

    state = state.copyWith(products: products);
  }
}
