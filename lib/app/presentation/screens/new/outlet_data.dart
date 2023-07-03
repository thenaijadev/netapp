import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netapp/app/providers/state_providers.dart';

class OutletData extends ConsumerStatefulWidget {
  const OutletData({super.key});

  @override
  ConsumerState<OutletData> createState() => _OutletDataState();
}

class _OutletDataState extends ConsumerState<OutletData> {
  @override
  Widget build(BuildContext context) {
    final outlet = ref.read(outletProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
              columns: const [
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Date Entered",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Outlet name',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Address',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'State',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'City',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Region',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Channel',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Sub Channel',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Name of Manager',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Manager's Phone Number",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Suppliers",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Products",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
              rows: List.generate(outlet.outlets.length, (index) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(Text('${outlet.outlets[index].date}')),
                    DataCell(Text('${outlet.outlets[index].name}')),
                    DataCell(Text('${outlet.outlets[index].address}')),
                    DataCell(Text('${outlet.outlets[index].state}')),
                    DataCell(Text('${outlet.outlets[index].city}')),
                    DataCell(Text('${outlet.outlets[index].region}')),
                    DataCell(Text('${outlet.outlets[index].channel}')),
                    DataCell(Text('${outlet.outlets[index].subChannel}')),
                    DataCell(Text('${outlet.outlets[index].managerName}')),
                    DataCell(
                        Text('${outlet.outlets[index].managerPhoneNumber}')),
                    DataCell(Text('${outlet.outlets[index].supplier}')),
                    DataCell(GestureDetector(
                        onTap: () {}, child: const Text('View'))),
                  ],
                );
              })),
        ),
      ),
    );
  }
}
