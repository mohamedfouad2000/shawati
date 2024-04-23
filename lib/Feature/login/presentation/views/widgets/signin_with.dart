import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';

class SigninWithWidget extends StatelessWidget {
  const SigninWithWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
          child: CircleAvatar(
            radius: 12.5,
            backgroundImage: AssetImage(AssetsData.googleLogo),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
          child: CircleAvatar(
            radius: 12.5,
            backgroundImage: AssetImage(AssetsData.appleLogo),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
          child: CircleAvatar(
            radius: 12.5,
            backgroundImage: AssetImage(AssetsData.facebookLogo),
          ),
        ),
      ],
    );
  }
}
