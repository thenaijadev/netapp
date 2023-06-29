import 'package:flutter/material.dart';
import 'package:netapp/app/presentation/widgets/edit_bottom_sheet_widget.dart';
import 'package:netapp/app/presentation/widgets/input_field_widget.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/lists.dart';

class OutletDetailsForm extends StatefulWidget {
  const OutletDetailsForm({super.key, required this.controller});
  final TabController controller;
  @override
  State<OutletDetailsForm> createState() => _OutletDetailsFormState();
}

class _OutletDetailsFormState extends State<OutletDetailsForm> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();

  final formfieldkey_3 = GlobalKey<FormFieldState>();
  final formfieldkey_4 = GlobalKey<FormFieldState>();
  final formfieldkey_5 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InputFieldWidget(
              label: "Outlet name",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_1),
          InputFieldWidget(
              label: "Address",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_2),
          DropDownInput(onChanged: (val) {}, label: "State", options: states()),
          DropDownInput(onChanged: (val) {}, label: "City", options: cities()),
          DropDownInput(
              onChanged: (val) {}, label: "Region", options: regions()),
          DropDownInput(
              onChanged: (val) {}, label: "Channel", options: channels),
          DropDownInput(
              onChanged: (val) {},
              label: "Off Trade Categories",
              options: offTradeCategories()),
          DropDownInput(
              onChanged: (val) {},
              label: "Sub Channels",
              options: subChannels()),
          InputFieldWidget(
              label: "Name of Manager",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_3),
          InputFieldWidget(
              label: "Phone Number of Manager",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_4),
          InputFieldWidget(
              label: "Supplier(s)",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_5),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              widget.controller.animateTo(1,
                  duration: const Duration(seconds: 1), curve: Curves.bounceIn);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xff004F9F))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 110.0),
              child: TextWidget(
                text: "Continue",
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

class YesNoRadio extends StatefulWidget {
  const YesNoRadio({super.key});

  @override
  State<YesNoRadio> createState() => _YesNoRadioState();
}

SingingCharacter? _character = SingingCharacter.lafayette;

class _YesNoRadioState extends State<YesNoRadio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Radio<SingingCharacter>(
          value: SingingCharacter.lafayette,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        Radio<SingingCharacter>(
          value: SingingCharacter.lafayette,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
      ],
    );
  }
}
