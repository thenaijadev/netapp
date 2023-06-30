part of 'outlet_bloc.dart';

abstract class OutletEvent extends Equatable {
  const OutletEvent();

  @override
  List<Object> get props => [];
}

class OutletEventInitializeOutlet extends OutletEvent {}

class OutletEventAddOutlet extends OutletEvent {}
