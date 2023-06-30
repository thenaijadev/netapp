import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'outlet_capture_day_event.dart';
part 'outlet_capture_day_state.dart';

class OutletCaptureDayBloc extends Bloc<OutletCaptureDayEvent, OutletCaptureDayState> {
  OutletCaptureDayBloc() : super(OutletCaptureDayInitial()) {
    on<OutletCaptureDayEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
