import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/app/providers/state_providers.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/router/routes.dart';

class OutletTable extends ConsumerStatefulWidget {
  const OutletTable({super.key});

  @override
  ConsumerState<OutletTable> createState() => _OutletDataState();
}

class _OutletDataState extends ConsumerState<OutletTable> {
  @override
  Widget build(BuildContext context) {
    final outlet = ref.read(outletProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: TextWidget(
                  text: "Outlet Data",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  border: TableBorder.all(color: AppColors.inputBorder),
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
                        DataCell(Text(
                            '${outlet.outlets[index].managerPhoneNumber}')),
                        DataCell(Text('${outlet.outlets[index].supplier}')),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.productsTable,
                                  arguments: outlet.outlets[index]);
                            },
                            child: const Text(
                              'View',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 44, 139),
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      ],
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
