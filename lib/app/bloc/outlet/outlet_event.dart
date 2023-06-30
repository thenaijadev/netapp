part of 'outlet_bloc.dart';

abstract class OutletEvent extends Equatable {
  const OutletEvent();

  @override
  List<Object> get props => [];
}

class OutletLoadEvent extends OutletEvent {}

class OutletIsLoadingEvent extends OutletEvent {}

class OutletEventAdd extends OutletEvent {
  const OutletEventAdd({
    required this.outletName,
    required this.date,
    required this.totalTimeSpent,
    required this.capturedBy,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.state,
    required this.city,
    required this.region,
    required this.channel,
    required this.subChannel,
    this.managerName,
    this.managerPhoneNumber,
    this.supplier,
  });
  final String outletName;

  final String date;
  final String totalTimeSpent;
  final String capturedBy;
  final double latitude;
  final double longitude;

  final String address;
  final String state;
  final String city;
  final String region;
  final String channel;
  final String subChannel;
  final String? managerName;
  final String? managerPhoneNumber;
  final String? supplier;
}
