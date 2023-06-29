import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netapp/app/bloc/products/products_bloc.dart';
import 'package:netapp/app/presentation/widgets/edit_bottom_sheet_widget.dart';
import 'package:netapp/app/presentation/widgets/loading.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/snackbar.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.data});
  final Map<dynamic, dynamic> data;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final String customer = widget.data['customer'];
    final int id = widget.data["id"];
    final String brandCategory = widget.data['brandCategory'];
    final String brand = widget.data["brand"];
    final String category = widget.data["category"];
    final String type = widget.data["type"];
    final String product = widget.data["product"];
    final String quantity = widget.data["quantity"].toString();
    final String date = widget.data["date"];
    ProductsBloc bloc = context.watch<ProductsBloc>();
    List<String> dataItems = [
      customer,
      brandCategory,
      brand,
      category,
      type,
      product,
      quantity
    ];
    List<String> labels = [
      "Customer",
      "Brand Category",
      "Brand",
      "Category",
      "Type",
      "Product",
      "Quantity"
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: const Color(0xff004F9F),
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                  child: TextWidget(
                    color: AppColors.white,
                    text: date,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                width: 400,
                child: Image.file(File(widget.data["image"])),
              ),
              SizedBox(
                height: 550,
                child: ListView.builder(
                    itemCount: labels.length,
                    itemBuilder: (context, index) {
                      return ListItem(
                          label: "${labels[index]}: ${dataItems[index]}");
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        enableDrag: false,
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) =>
                            EditForm(data: widget.data),
                      );
                    },
                    child: const Card(
                      color: Color(0xff004F9F),
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                        child: TextWidget(
                          color: AppColors.white,
                          text: "Edit",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  BlocConsumer<ProductsBloc, ProductsState>(
                    listener: (context, state) {
                      if (state is ProductStateProductDeleted) {
                        Navigator.pop(context);
                      }
                      if (state is ProductStateError) {
                        InfoSnackBar.showErrorSnackBar(
                            context, "Unable to delete item");
                      }
                    },
                    builder: (context, state) {
                      if (state is ProductStateIsLoading) {
                        return const LoadingWidget();
                      }
                      return InkWell(
                        onTap: () {
                          bloc.add(ProductEventDeleteProduct(id: id));
                          bloc.add(ProductEventGetAllProduts());
                        },
                        child: const Card(
                          color: Color(0xff004F9F),
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 55),
                            child: TextWidget(
                              color: AppColors.white,
                              text: "Delete",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 211, 212, 213),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextWidget(text: label),
          ),
        ),
      ),
    );
  }
}
