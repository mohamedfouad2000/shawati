import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/terms_screen_body.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen(
      {super.key, required this.termsText, required this.termsTextAr});
  final String termsText;
  final String termsTextAr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: TermsScreenBody(termsText: termsText, termsTextAr: termsTextAr),
    );
  }
}
