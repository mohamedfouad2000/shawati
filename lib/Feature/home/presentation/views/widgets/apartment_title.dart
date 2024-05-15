import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';

class ApartMentTitle extends StatelessWidget {
  const ApartMentTitle(
      {super.key, required this.catName, required this.catNameAr});
  final String catName;
  final String catNameAr;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          LocalizationCubit.get(context).isArabic() ? catNameAr : catName,
          style: StylesData.font18,
        )),
        InkWell(
          onTap: () {},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Text(
              //   "Showing ",
              //   style: StylesData.font12.copyWith(color: Colors.black),
              // ),
              // Text(
              //   "263 home",
              //   style: StylesData.font12.copyWith(color: ConstColor.kMainColor),
              // ),
            ],
          ),
        )
      ],
    );
  }
}
