import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/login/presentation/views/login_view.dart';
import 'package:shawati/generated/l10n.dart';

class LoginInHere extends StatelessWidget {
  const LoginInHere({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).Alreadyhaveanaccount,
          style: StylesData.font14,
        ),
        InkWell(
          onTap: () {
            NavegatorPush(context, const LoginView());
          },
          child: Text(
            S.of(context).signInhere,
            style: StylesData.font14.copyWith(
                color: ConstColor.kMainColor, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
