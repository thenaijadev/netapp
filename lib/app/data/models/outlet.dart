// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:netapp/app/data/models/product.dart';

class Outlet {
  Outlet(
      {this.date,
      this.capturedBy,
      this.latitude,
      this.longitude,
      this.name,
      this.address,
      this.state,
      this.city,
      this.region,
      this.channel,
      this.subChannel,
      this.managerName,
      this.managerPhoneNumber,
      this.supplier,
      this.products});
  final String? date;
  final String? capturedBy;
  final double? latitude;
  final double? longitude;
  final String? name;
  final String? address;
  final String? state;
  final String? city;
  final String? region;
  final String? channel;
  final String? subChannel;
  final String? managerName;
  final String? managerPhoneNumber;
  final String? supplier;
  final List<Product>? products;

  Outlet copyWith({
    String? date,
    String? capturedBy,
    double? latitude,
    double? longitude,
    String? name,
    String? address,
    String? state,
    String? city,
    String? region,
    String? channel,
    String? subChannel,
    String? managerName,
    String? managerPhoneNumber,
    String? supplier,
    List<Product>? products,
  }) {
    return Outlet(
      date: date ?? this.date,
      capturedBy: capturedBy ?? this.capturedBy,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      name: name ?? this.name,
      address: address ?? this.address,
      state: state ?? this.state,
      city: city ?? this.city,
      region: region ?? this.region,
      channel: channel ?? this.channel,
      subChannel: subChannel ?? this.subChannel,
      managerName: managerName ?? this.managerName,
      managerPhoneNumber: managerPhoneNumber ?? this.managerPhoneNumber,
      supplier: supplier ?? this.supplier,
      products: products ?? this.products,
    );
  }

  @override
  String toString() {
    return 'Outlet(date: $date, capturedBy: $capturedBy, latitude: $latitude, longitude: $longitude, name: $name, address: $address, state: $state, city: $city, region: $region, channel: $channel, subChannel: $subChannel, managerName: $managerName, managerPhoneNumber: $managerPhoneNumber, supplier: $supplier, products: $products)';
  }
}
