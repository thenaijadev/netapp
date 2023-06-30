// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:netapp/app/data/models/product.dart';

class Outlet {
  Outlet(
      {required this.date,
      required this.totalTimeSpent,
      required this.capturedBy,
      required this.latitude,
      required this.longitude,
      required this.name,
      required this.address,
      required this.state,
      required this.city,
      required this.region,
      required this.channel,
      required this.subChannel,
      required this.managerName,
      required this.managerPhoneNumber,
      required this.supplier,
      this.products});
  final String date;
  final String totalTimeSpent;
  final String capturedBy;
  final double latitude;
  final double longitude;
  final String name;
  final String address;
  final String state;
  final String city;
  final String region;
  final String channel;
  final String subChannel;
  final String? managerName;
  final String? managerPhoneNumber;
  final String? supplier;
  final List<Product>? products;

  Outlet copyWith({
    String? date,
    String? totalTimeSpent,
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
      date: this.date,
      totalTimeSpent: this.totalTimeSpent,
      capturedBy: this.capturedBy,
      latitude: this.latitude,
      longitude: this.longitude,
      name: this.name,
      address: this.address,
      state: this.state,
      city: this.city,
      region: this.region,
      channel: this.channel,
      subChannel: this.subChannel,
      managerName: this.managerName,
      managerPhoneNumber: this.managerPhoneNumber,
      supplier: this.supplier,
      products: this.products,
    );
  }
}
