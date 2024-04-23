import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/screens/product_details_screen.dart';

class productList extends StatelessWidget {
  const productList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          // mainAxisSpacing: 10,
          childAspectRatio: .7,
          children: [...List.generate(10, (index) => item(context))]),
    );
  }
}

Widget item(context) => InkWell(
      onTap: () {
        NavegatorPush(context, const ProductDetailsScreen());
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage(AssetsData.testimage2),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  right: 8,
                  bottom: -20,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: ConstColor.kMainColor,
                        child: const Center(
                          child: Image(
                              image: AssetImage(
                                AssetsData.save,
                              ),
                              width: 15,
                              height: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "The family House",
                  style: StylesData.font13.copyWith(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                  size: 12,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "Jeddah, Saudi Arabia",
                  style: StylesData.font12
                      .copyWith(color: Colors.black, fontSize: 6),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "SAR 150 ",
                  style: StylesData.font8.copyWith(
                    color: ConstColor.kMainColor,
                  ),
                ),
                Text(
                  "/Day",
                  style: StylesData.font7.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );
