import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/screens/apartments_screen.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          categoryItem(image: AssetsData.all, context: context),
          const SizedBox(
            width: 10,
          ),
          categoryItem(image: AssetsData.c1, context: context),
          const SizedBox(
            width: 10,
          ),
          categoryItem(image: AssetsData.c2, context: context),
          const SizedBox(
            width: 10,
          ),
          categoryItem(image: AssetsData.c3, context: context),
          const SizedBox(
            width: 10,
          ),
          categoryItem(image: AssetsData.c4, context: context),
        ],
      ),
    );
  }

  Widget categoryItem({required String image, required context}) {
    return InkWell(
      onTap: () {
        NavegatorPush(context, const ApartmentsScreen());
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: .7),
            borderRadius: const BorderRadius.all(
              Radius.circular(13),
            )),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image(
            image: AssetImage(image),
            height: 15,
            width: 15,
          ),
        ),
      ),
    );
  }
}
