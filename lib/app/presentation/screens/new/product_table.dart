import 'package:flutter/material.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';

class ProductsTable extends StatefulWidget {
  const ProductsTable({super.key, required this.outlet});
  final Outlet outlet;
  @override
  State<ProductsTable> createState() => _ProductsTableState();
}

class _ProductsTableState extends State<ProductsTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: TextWidget(
                    text: "Products",
                    fontSize: 30,
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
                            "Outlet found",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Brand',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'SKU',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Categories',
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
                            'Is brand available',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Out of stock',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'New listing',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Price',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            "Has price changed",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            "New price",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                    rows:
                        List.generate(widget.outlet.products!.length, (index) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(widget.outlet.name!)),
                          DataCell(Text(widget.outlet.products![index].brand)),
                          DataCell(Text(widget.outlet.products![index].sku)),
                          DataCell(
                              Text(widget.outlet.products![index].category)),
                          DataCell(
                              Text(widget.outlet.products![index].channel)),
                          DataCell(Text(widget
                              .outlet.products![index].isAvailable
                              .toString())),
                          DataCell(Text(widget
                              .outlet.products![index].isOutOfStock
                              .toString())),
                          DataCell(Text(widget
                              .outlet.products![index].isNewListing
                              .toString())),
                          DataCell(Text(
                              widget.outlet.products![index].price.toString())),
                          DataCell(Text(widget
                              .outlet.products![index].hasPriceChanged
                              .toString())),
                          DataCell(Text(widget.outlet.products![index].newPrice
                              .toString())),
                        ],
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
