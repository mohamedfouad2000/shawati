import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/screens/profile_edit_screen.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                  image: AssetImage(AssetsData.testimage), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "mohamed elmohandes",
                  style: StylesData.font18,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "view profile",
                  style:
                      StylesData.font12.copyWith(color: ConstColor.kMainColor),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                NavegatorPush(context, const ProfileInfoScreen());
              },
              icon: Icon(
                Icons.keyboard_double_arrow_right_sharp,
                size: 20,
                color: ConstColor.kMainColor,
              ))
        ],
      ),
    );
  }
}
