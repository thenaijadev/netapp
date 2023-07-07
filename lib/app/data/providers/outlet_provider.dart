import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/data/models/product.dart';
import 'package:netapp/utilities/logger.dart';

class OutletNotifier extends StateNotifier<List<Outlet>> {
  Outlet? _outlet;

  OutletNotifier() : super([]);

  Outlet? get outlet => _outlet;

  final List<Product> _products = [];
  List<Outlet> _outlets = [];

  List<Outlet> get outlets => _outlets;

  List<Product> get products => _products;
  final outletBox = Hive.box("outlet_box");

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
      required supplier}) async {
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
    // state.add(_outlet!);

    outletBox.add(_outlet?.toMap());

    List<Outlet> theOutLets = await getOutlets();

    state = theOutLets;
    _outlets = state;
    // state = theOutLets;
    // _outlets = state;
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
      image}) async {
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
    List<Outlet> stateList = await getOutlets();

    final lastItem = stateList.last;
    final updatedItem = lastItem.copyWith(products: products);
    int index = stateList.length - 1;

    final data = updatedItem.toMap();
    await outletBox.put(index, data);

    List<Outlet> newOutlets = await getOutlets();
    logger.e(newOutlets);
    state = newOutlets;
    _outlets = state;
  }

  Future<List<Outlet>> getOutlets() async {
    List<Outlet> list = [];
    for (var key in outletBox.keys) {
      var dataAsMap = await outletBox.getAt(key);
      var dataAsOutlet = Outlet.fromMap(dataAsMap);
      list.add(dataAsOutlet);
    }

    state = list;
    _outlets = state;
    return list;
  }
}
