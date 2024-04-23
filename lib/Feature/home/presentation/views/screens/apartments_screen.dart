import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/apartments_screen_body.dart';

class ApartmentsScreen extends StatelessWidget {
  const ApartmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWithNotification(context),
      body: const ApartmentsScreenBody(),
    );
  }
}
