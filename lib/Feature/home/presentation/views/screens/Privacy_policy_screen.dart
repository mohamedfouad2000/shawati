import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/privacy_policy_screen_body.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen(
      {super.key, required this.privacyText, required this.privacyTextAr});
  final String privacyText;
  final String privacyTextAr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: PrivacyPolicyScreenBody(
          privacyText: privacyText, privacyTextAr: privacyTextAr),
    );
  }
}
