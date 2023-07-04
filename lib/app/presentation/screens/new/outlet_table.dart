import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/new/header_underline.dart';
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
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final outlet = ref.read(outletProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          AnimationSearchBar(
              backIconColor: Colors.black,
              centerTitle: 'Outlets',
              onChanged: (text) => debugPrint(text),
              searchTextEditingController: controller,
              horizontalPadding: 5),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                  itemCount: outlet.outlets.length,
                  itemBuilder: (BuildContext context, index) {
                    return MobileDataTable(
                      outletList: outlet.outlets,
                      index: index,
                    );
                  }))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 44, 139),
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.dataCapture);
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}

class MobileDataTable extends StatelessWidget {
  const MobileDataTable(
      {super.key, required this.outletList, required this.index});
  final List<Outlet> outletList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 44, 139),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: "Name:",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                const TextWidget(
                  text: "Okwor outlet",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.productsTable,
                        arguments: outletList[index]);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const TextWidget(
                      text: "Trade visit",
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 44, 139),
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
          DataRowWidget(label: "Date entered", value: outletList[index].date),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(label: "Address", value: outletList[index].address),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(label: "State", value: outletList[index].state),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(label: "City", value: outletList[index].city),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(label: "Region", value: outletList[index].region),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(label: "Channel", value: outletList[index].channel),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(
              label: "Sub-channel", value: outletList[index].subChannel),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(
              label: "Manager's name", value: outletList[index].managerName),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(
              label: "Manager's phone",
              value: outletList[index].managerPhoneNumber),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(label: "Supplier", value: outletList[index].supplier),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(
              label: "Latitude", value: outletList[index].latitude.toString()),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(
              label: "Longitude", value: outletList[index].latitude.toString()),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
        ],
      ),
    );
  }
}
