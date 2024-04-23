import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_details_screen_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        widget: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey.withOpacity(.4), width: .7),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: ImageIcon(
                  const AssetImage(AssetsData.save),
                  color: ConstColor.kMainColor,
                  size: 8,
                ),
              ),
            ),
          ),
        ),
      ),
      body: const ProductDetailsScreenBody(),
    );
  }
}
