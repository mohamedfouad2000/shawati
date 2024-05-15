import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/presentation/views/screens/see_all_screen.dart';
import 'package:shawati/generated/l10n.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
    required this.services,
  });
  final List<Service> services;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          S.of(context).allProperties,
          style: StylesData.font18,
        )),
        TextButton(
            onPressed: () {
              NavegatorPush(
                  context,
                  SeeAllScreen(
                    services: services,
                  ));
            },
            child: Text(
              S.of(context).seeAll,
              style: StylesData.font16,
            ))
      ],
    );
  }
}
