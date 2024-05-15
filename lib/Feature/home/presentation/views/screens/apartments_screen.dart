import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/apartments_screen_body.dart';

class ApartmentsScreen extends StatelessWidget {
  const ApartmentsScreen(
      {super.key,
      required this.catId,
      required this.catName,
      required this.catNameAr});
  final int catId;

  final String catName;
  final String catNameAr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWithNotification(context),
      body: ApartmentsScreenBody(
        catId: catId,
        catName: catName,
        catNameAr: catNameAr,
      ),
    );
  }
}
