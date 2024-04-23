import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/screens/filter_screen.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: customTextFiled(
              controller: searchController,
              hintText: "Search",
              prefixIcon: const Padding(
                padding: EdgeInsets.all(12.0),
                child: ImageIcon(
                  AssetImage(
                    AssetsData.searchicon,
                  ),
                  size: 6,
                  color: Colors.grey,
                ),
              )),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            NavegatorPush(context, const FilterScreen());
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: ConstColor.kMainColor,
                border: Border.all(
                  color: ConstColor.kMainColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(13),
                )),
            child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.filter_list_rounded,
                  color: Colors.white,
                  size: 22,
                )),
          ),
        ),
      ],
    );
  }
}
