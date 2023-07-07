import 'package:flutter/material.dart';
import 'package:netapp/app/presentation/widgets/input_field_widget.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';

class CompetitionReviewForm extends StatefulWidget {
  const CompetitionReviewForm({super.key});

  @override
  State<CompetitionReviewForm> createState() => _CompetitionReviewFormState();
}

class _CompetitionReviewFormState extends State<CompetitionReviewForm> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final formfieldkey_3 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        InputFieldWidget(
            label: "What brand is activated?",
            hintText: "",
            onChanged: (val) {},
            textFieldkey: formfieldkey_1),
        InputFieldWidget(
            label: "What activation?",
            hintText: "",
            onChanged: (val) {},
            textFieldkey: formfieldkey_2),
        InputFieldWidget(
            label: "Any additional information?",
            hintText: "",
            onChanged: (val) {},
            textFieldkey: formfieldkey_3),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, top: 30),
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
                onPressed: () async {},
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
    ));
  }
}
