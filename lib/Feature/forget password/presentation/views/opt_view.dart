import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/forget%20password/presentation/views/widgets/otp_view_body.dart';

class OPTView extends StatelessWidget {
  const OPTView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(context),
      body: const OTPViewBody(),
    );
  }
}
