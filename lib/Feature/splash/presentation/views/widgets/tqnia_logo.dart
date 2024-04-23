import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';

class TqniaLogo extends StatelessWidget {
  const TqniaLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(AssetsData.tqniaLogo),
      width: 170,
    );
  }
}
