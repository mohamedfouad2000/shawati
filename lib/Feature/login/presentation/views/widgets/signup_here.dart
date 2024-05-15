import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/register/presentation/views/register_view.dart';
import 'package:shawati/generated/l10n.dart';

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
          S.of(context).Donthaveanaccount,
          style: StylesData.font14,
        ),
        InkWell(
          onTap: () {
            NavegatorPush(context, const RegisterView());
          },
          child: Text(
            S.of(context).SignuPHere,
            style: StylesData.font14.copyWith(
                color: ConstColor.kMainColor, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}
