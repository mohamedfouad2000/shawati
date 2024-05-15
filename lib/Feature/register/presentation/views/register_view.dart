import 'package:flutter/material.dart';
import 'package:shawati/Feature/register/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterViewBody(
          confirmpasswordController: confirmpasswordController,
          phoneController: phoneController,
          passwordController: passwordController,
          nameController: nameController),
    );
  }
}
