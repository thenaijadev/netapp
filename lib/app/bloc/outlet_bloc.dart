import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'outlet_event.dart';
part 'outlet_state.dart';

class OutletBloc extends Bloc<OutletEvent, OutletState> {
  OutletBloc() : super(OutletInitial()) {
    on<OutletEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
