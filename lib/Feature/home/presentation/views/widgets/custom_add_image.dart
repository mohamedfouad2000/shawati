import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';

class CustomAddImage extends StatelessWidget {
  const CustomAddImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        children: [
          const Image(
            image: AssetImage(
              'assets/images/center.png',
            ),
            height: 60,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Drop your files here, or ',
                    style: StylesData.font11.copyWith(color: Colors.black)),
                TextSpan(
                    text: 'browse',
                    style: StylesData.font11
                        .copyWith(color: ConstColor.kMainColor)),
              ],
            ),
          ),
          Text(
            "JPG, PNG, PDF (Max 800x400px - 2Mo)",
            style: StylesData.font9,
          )
        ],
      ),
    );
  }
}
