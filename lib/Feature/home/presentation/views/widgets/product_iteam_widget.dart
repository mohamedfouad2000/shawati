import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage(AssetsData.testimage2),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                right: 18,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                      radius: 20,
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
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                "Fransico Apartment",
                style: StylesData.font24Google,
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
                size: 15,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "Jeddah, Saudi Arabia",
                style: StylesData.font12.copyWith(color: Colors.black),
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
                style: StylesData.font18.copyWith(color: ConstColor.kMainColor),
              ),
              Text(
                "/Day",
                style: StylesData.font16
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}
