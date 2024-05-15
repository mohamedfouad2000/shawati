import 'package:flutter/material.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/local/cache_Helper.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/home_view.dart';
import 'package:shawati/Feature/login/presentation/views/login_view.dart';
import 'package:shawati/Feature/splash/presentation/views/widgets/splach_image_logo.dart';
import 'package:shawati/Feature/splash/presentation/views/widgets/tqnia_logo.dart';

class SplachViewBody extends StatefulWidget {
  const SplachViewBody({super.key});

  @override
  State<SplachViewBody> createState() => _SplachViewBodyState();
}

class _SplachViewBodyState extends State<SplachViewBody> {
  bool isloading = false;
  Future fadeInAnimation() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isloading = true;
    });

    await Future.delayed(const Duration(seconds: 2));
    String x = CacheHelper.getData(key: 'Token') ?? '';
    print(x);
    if (x != '') {
      TOKEN = x;
      Nav(context, const HomeView(currentidex: 0));
    } else {
      Nav(context, const LoginView());
    }
  }

  @override
  void initState() {
    super.initState();
    fadeInAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: ((MediaQuery.of(context).size.height) / 2) - 100,
          ),
          const SplachViewImage(),
          const SizedBox(
            height: 20,
          ),
          if (isloading)
            const CircularProgressIndicator(
              strokeWidth: 4.2,
            ),
          const Spacer(),
          const TqniaLogo(),
        ],
      ),
    );
  }
}
