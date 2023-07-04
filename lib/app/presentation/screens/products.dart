import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netapp/app/bloc/products/products_bloc.dart';

import 'package:netapp/app/presentation/widgets/buttom_sheet_widget.dart';
import 'package:netapp/app/presentation/widgets/loading.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/router/routes.dart';
import 'package:netapp/utilities/snackbar.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    super.key,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ProductsBloc bloc = context.watch<ProductsBloc>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            enableDrag: false,
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) => const BottomSheetScreen(),
          );
        },
        backgroundColor: const Color(0xff004F9F),
        child: const Icon(Icons.add),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: BlocConsumer<ProductsBloc, ProductsState>(
            listener: (context, state) {
              if (state is ProductStateError) {
                InfoSnackBar.showErrorSnackBar(context, state.toString());
              }
            },
            builder: (context, state) {
              if (state is ProductStateIsLoading) {
                return const LoadingWidget();
              } else if (state is ProductStateAllProductsRetrieved) {
                if (state.products.isEmpty) {
                  return const Center(
                    child: TextWidget(
                        text: "There is nothing to show, Add a new item"),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextWidget(
                          text: "Customers",
                          fontSize: 30,
                        ),
                      ),
                      Flexible(
                        child: ListView.builder(
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 211, 212, 213),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, Routes.details,
                                          arguments: state.products[index]);
                                    },
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        child: Image.file(File(
                                            state.products[index]["image"])),
                                      ),
                                      title: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10),
                                        child: TextWidget(
                                            text: state.products[index]
                                                ["customer"]),
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: TextWidget(
                                          text:
                                              "${state.products[index]["date"]}",
                                          fontSize: 10,
                                        ),
                                      ),
                                      trailing: const Icon(
                                          Icons.chevron_right_rounded),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }

              return const Text("");
            },
          ),
        ),
      ),
    );
  }
}
