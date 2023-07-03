// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netapp/app/data/models/outlet.dart';

part 'outlet_event.dart';
part 'outlet_state.dart';

class OutletBloc extends Bloc<OutletEvent, OutletState> {
  OutletBloc() : super(OutletInitial()) {
    // ignore: void_checks
    on<OutletEventAddWithoutProduct>((event, emit) async {
      print({
        "date": event.date,
        "capturedBy": event.capturedBy,
        "latitude": event.latitude,
        "longitude": event.longitude,
        "name": event.outletName,
        "address": event.address,
        "state": state,
        "city": event.state,
        "region": event.region,
        "channel": event.channel,
        "subChannel": event.subChannel,
        "managerName": event.managerName,
        "managerPhoneNumber": event.managerPhoneNumber,
        "supplier": event.managerPhoneNumber,
      });
    });
  }
}
