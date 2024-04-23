import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';

class AcceptAllTerms extends StatefulWidget {
  const AcceptAllTerms({super.key});

  @override
  State<AcceptAllTerms> createState() => _AcceptAllTermsState();
}

class _AcceptAllTermsState extends State<AcceptAllTerms> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 25,
          height: 25,
          child: Checkbox(
            checkColor: Colors.white,
            focusColor: ConstColor.kMainColor,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'I accept all the ',
          style: StylesData.font12,
        ),
        Text(
          'Terms & Conditions',
          style: StylesData.font12
              .copyWith(color: Colors.black, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
