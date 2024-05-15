import 'package:flutter/material.dart';
import 'package:shawati/Feature/login/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: LoginViewBody(
        phoneController: phoneController,
        passwordController: passwordController,
      ),
    );
  }
}
