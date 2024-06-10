import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/location/presentation/views/widgets/enable_location_body.dart';

class EnableLocation extends StatelessWidget {
  const EnableLocation({super.key, required this.fromLogin});
  final bool fromLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: !fromLogin ? customAppBar(context) : AppBar(),
      body: const EnableLocationBody(),
    );
  }
}
