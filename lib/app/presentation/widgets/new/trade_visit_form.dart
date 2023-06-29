import 'package:flutter/material.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/edit_bottom_sheet_widget.dart';
import 'package:netapp/app/presentation/widgets/input_field_widget.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/lists.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TradeVisitForm extends StatefulWidget {
  const TradeVisitForm(
      {super.key,
      required this.brand,
      required this.category,
      required this.sku,
      required this.channel});
  final String brand;
  final String category;
  final String sku;
  final String channel;

  @override
  State<TradeVisitForm> createState() => _TradeVisitFormState();
}

class _TradeVisitFormState extends State<TradeVisitForm> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final formfieldkey_3 = GlobalKey<FormFieldState>();
  final formfieldkey_4 = GlobalKey<FormFieldState>();
  final formfieldkey_5 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final brand = widget.brand;
    final sku = widget.sku;
    final category = widget.category;
    final channel = widget.channel;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const HorizontalDivider(width: 500),
            DataRowWidget(
              label: "Brand:",
              value: brand,
            ),
            const HorizontalDivider(width: 500),
            DataRowWidget(
              label: "Sku",
              value: sku,
            ),
            const HorizontalDivider(width: 500),
            DataRowWidget(
              label: "Category",
              value: category,
            ),
            const HorizontalDivider(width: 500),
            DataRowWidget(
              label: "Channel",
              value: channel,
            ),
            const HorizontalDivider(width: 500),
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
  final products = productList
      .map((e) => TradeVisitForm(
          brand: e["Brand"],
          category: e["Category"],
          sku: e["Sku"],
          channel: e["Channel"]))
      .toList();
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: Column(
        children: [
          SmoothPageIndicator(
              controller: controller,
              count: products.length,
              effect: const ScrollingDotsEffect(dotWidth: 5, dotHeight: 8),
              onDotClicked: (index) {}),
          Flexible(
            child: PageView(
              controller: controller,
              children: products,
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
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear);
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
