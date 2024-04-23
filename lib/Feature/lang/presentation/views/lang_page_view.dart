import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/lang/presentation/views/widgets/lang_page_body_view.dart';

class LangPageView extends StatelessWidget {
  const LangPageView({super.key, required this.fromLogin});
  final bool fromLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: LangPageViewBody(fromLogin: fromLogin),
    );
  }
}
