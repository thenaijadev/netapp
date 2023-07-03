import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/data/models/product.dart';

class OutletNotifier extends StateNotifier<List<Outlet>> {
  Outlet? _outlet;

  OutletNotifier() : super([]);

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
      required stateCity,
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
        state: stateCity,
        city: city,
        region: region,
        channel: channel,
        subChannel: subChannel,
        managerName: managerName,
        managerPhoneNumber: managerPhoneNumber,
        supplier: supplier);
    state.add(_outlet!);
  }

  void addProductToList(
      {required brand,
      required sku,
      required channel,
      required category,
      required isAvailable,
      required isOutOfStock,
      required isNewListing,
      required price,
      required hasPriceChanged,
      required newPrice,
      image}) {
    final Product product = Product(
        channel: channel,
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
    List<Outlet> stateList = state;

    final lastItem = stateList.last;
    final updatedItem = lastItem.copyWith(products: products);

    stateList.removeAt(stateList.length - 1);
    stateList.add(updatedItem);
    state = stateList;
  }
}
