import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/register/presentation/views/register_view.dart';

class SignUpHere extends StatelessWidget {
  const SignUpHere({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: StylesData.font14,
        ),
        InkWell(
          onTap: () {
            NavegatorPush(context, const RegisterView());
          },
          child: Text(
            "sign up here",
            style: StylesData.font14.copyWith(
                color: ConstColor.kMainColor, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
