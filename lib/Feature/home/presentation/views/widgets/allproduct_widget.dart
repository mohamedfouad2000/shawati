import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/styles.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          "All Properties",
          style: StylesData.font18,
        )),
        TextButton(
            onPressed: () {},
            child: Text(
              "See All",
              style: StylesData.font16,
            ))
      ],
    );
  }
}
