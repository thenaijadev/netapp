import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'captureday_event.dart';
part 'captureday_state.dart';

class CapturedayBloc extends Bloc<CapturedayEvent, CapturedayState> {
  CapturedayBloc() : super(CapturedayInitial()) {
    on<CapturedayEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
