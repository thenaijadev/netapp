import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/data/providers/outlet_provider.dart';

final outletProvider = StateNotifierProvider<OutletNotifier, List<Outlet>>(
    (ref) => OutletNotifier());
