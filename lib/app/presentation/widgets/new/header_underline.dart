import 'package:flutter/material.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';

class HeaderUnderline extends StatelessWidget {
  const HeaderUnderline({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 5,
          width: 100,
          decoration: const BoxDecoration(
            color: AppColors.hintColor,
          ),
        ),
        Container(
          height: 5,
          width: 150,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 0, 44, 139),
          ),
        ),
        Container(
          height: 5,
          width: 100,
          decoration: const BoxDecoration(
            color: AppColors.hintColor,
          ),
        )
      ],
    );
  }
}
