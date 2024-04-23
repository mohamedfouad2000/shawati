import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'package:shawati/Feature/home/presentation/views/widgets/allproduct_widget.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/category_widget.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_iteam_widget.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/search_widget.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16, top: 32, bottom: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomHomeAppBar(),
            const SizedBox(
              height: 10,
            ),
            HomeSearchWidget(searchController: searchController),
            const SizedBox(
              height: 10,
            ),
            const CategoryWidget(),
            const SizedBox(
              height: 10,
            ),
            const AllProducts(),
            const SizedBox(
              height: 10,
            ),
            const ProductItem(),
            const SizedBox(
              height: 10,
            ),
            const ProductItem(),
          ],
        ),
      ),
    );
  }
}
