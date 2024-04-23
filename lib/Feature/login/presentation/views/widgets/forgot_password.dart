import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/forget%20password/presentation/views/forget_password_view.dart';

class ForGotPassword extends StatefulWidget {
  const ForGotPassword({super.key});

  @override
  State<ForGotPassword> createState() => _ForGotPasswordState();
}

class _ForGotPasswordState extends State<ForGotPassword> {
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
          'Remember me',
          style: StylesData.font12,
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            NavegatorPush(context, const ForgetPasswordView());
          },
          child: Text(
            'Forgot Your Password?',
            style: StylesData.font10,
          ),
        ),
      ],
    );
  }
}
