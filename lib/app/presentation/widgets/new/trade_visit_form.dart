import 'package:flutter/material.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/edit_bottom_sheet_widget.dart';
import 'package:netapp/app/presentation/widgets/input_field_widget.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/lists.dart';

class TradeVisitForm extends StatefulWidget {
  const TradeVisitForm({
    super.key,
  });

  @override
  State<TradeVisitForm> createState() => _TradeVisitFormState();
}

class _TradeVisitFormState extends State<TradeVisitForm> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final formfieldkey_3 = GlobalKey<FormFieldState>();
  final formfieldkey_4 = GlobalKey<FormFieldState>();
  final formfieldkey_5 = GlobalKey<FormFieldState>();
  String sku = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const HorizontalDivider(width: 500),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: TextWidget(
                text: "Enter details on relevant brands and products",
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const HorizontalDivider(width: 500),
            DropDownInput(
                onChanged: (val) {
                  setState(() {});
                },
                enableSearch: true,
                label: "Brand:",
                options: brandsDropdownList()),
            DropDownInput(
                onChanged: (val) {
                  setState(() {
                    sku = val.name.toString();
                  });
                },
                enableSearch: true,
                label: "SKU:",
                options: skus()),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 215.0, bottom: 4),
              child: TextWidget(
                text: "Category:",
                fontSize: 15,
                color: Color.fromARGB(255, 110, 111, 117),
              ),
            ),
            Container(
              height: 40,
              width: 278,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.inputBorder),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: TextWidget(text: getCategory(sku)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 215.0, bottom: 4, top: 15),
              child: TextWidget(
                text: "Channel:",
                fontSize: 15,
                color: Color.fromARGB(255, 110, 111, 117),
              ),
            ),
            Container(
              height: 40,
              width: 278,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.inputBorder),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: TextWidget(text: getChannel(sku)),
              ),
            ),
            DropDownInput(
                onChanged: (val) {},
                label: "Is this brand available?",
                options: yesOrNo),
            DropDownInput(
                onChanged: (val) {},
                label: "Is it out of stock?",
                options: yesOrNo),
            DropDownInput(
                onChanged: (val) {},
                label: "Is it a new listing?",
                options: yesOrNo),
            InputFieldWidget(
                label: "What is it's price?",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_1),
            DropDownInput(
                onChanged: (val) {},
                label: "As its price changed since its last visit",
                options: yesOrNo),
            InputFieldWidget(
                label: "If yes, What is it's new price?",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_2),
            const SizedBox(
              height: 20,
            ),
            const TextWidget(
              text: "Competition review (Not mandatory)",
              fontSize: 18,
            ),
            InputFieldWidget(
                label: "What brand is activated",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_3),
            InputFieldWidget(
                label: "What activation",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_4),
            InputFieldWidget(
                label: "Additional information",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_5),
            const Padding(
              padding: EdgeInsets.only(right: 180.0, top: 20),
              child: TextWidget(
                text: "Add an image",
                color: Color.fromARGB(255, 110, 111, 117),
                fontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 240, top: 10),
              child: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 0, 44, 139),
                  radius: 15,
                  child: Center(child: Icon(Icons.add)),
                ),
              ),
            )
          ]),
        )
      ],
    );
  }
}

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: Column(
        children: [
          // SmoothPageIndicator(
          //     controller: controller,
          //     count: products.length,
          //     effect: const ScrollingDotsEffect(dotWidth: 5, dotHeight: 8),
          //     onDotClicked: (index) {}),
          Flexible(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: const [TradeVisitForm()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              width: 272,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.inputBorder),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 0, 44, 139),
                    ),
                  ),
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                  child: const TextWidget(
                    text: "Next",
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
