part of 'outlet_bloc.dart';

abstract class OutletState extends Equatable {
  const OutletState();

  @override
  List<Object> get props => [];
}

class OutletInitial extends OutletState {}

class OutletIsLoadingState extends OutletState {}

class OutletStateAdded extends OutletState {
  const OutletStateAdded({
    required this.outlet,
    required this.date,
    required this.month,
    required this.numberToday,
    required this.numberThisMonth,
  });
  final String date;
  final String month;
  final String numberToday;
  final String numberThisMonth;
  final Outlet outlet;
}
