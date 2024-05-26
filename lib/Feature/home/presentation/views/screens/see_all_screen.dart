import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/see_al_screnn_body.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen(
      {super.key, required this.services, required this.contactDetails});
  final List<Service> services;
  final ContactDetails contactDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SeeAllScreenBody(
        services: services,
        contactDetails: contactDetails,
      ),
    );
  }
}
