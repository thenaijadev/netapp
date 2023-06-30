import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netapp/app/data/models/outlet.dart';

part 'outlet_event.dart';
part 'outlet_state.dart';

class OutletBloc extends Bloc<OutletEvent, OutletState> {
  OutletBloc() : super(OutletInitial()) {
    on<OutletEventAdd>((event, emit) {
      emit(OutletIsLoadingState());
      final Outlet outlet = Outlet(
          date: event.date,
          totalTimeSpent: event.totalTimeSpent,
          capturedBy: event.capturedBy,
          latitude: event.latitude,
          longitude: event.longitude,
          name: event.outletName,
          address: event.address,
          state: event.state,
          city: event.city,
          region: event.region,
          channel: event.channel,
          subChannel: event.subChannel,
          managerName: event.managerName,
          managerPhoneNumber: event.managerPhoneNumber,
          supplier: event.supplier);
    });
  }
}
