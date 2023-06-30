part of 'outlet_bloc.dart';

abstract class OutletState extends Equatable {
  const OutletState();

  @override
  List<Object> get props => [];
}

class OutletInitial extends OutletState {}

// class OutletStateOutletStart extends OutletState{
//   OutletStateOutletStart({});
//   final String dateCreated;
//   final String 
// }