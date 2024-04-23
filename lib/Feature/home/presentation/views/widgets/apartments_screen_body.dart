import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:shawati/Feature/home/presentation/views/widgets/apartment_title.dart';

import 'package:shawati/Feature/home/presentation/views/widgets/product_list.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/search_widget.dart';

class ApartmentsScreenBody extends StatefulWidget {
  const ApartmentsScreenBody({super.key});

  @override
  State<ApartmentsScreenBody> createState() => _ApartmentsScreenBodyState();
}

class _ApartmentsScreenBodyState extends State<ApartmentsScreenBody> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const ApartMentTitle(),
          const SizedBox(
            height: 10,
          ),
          HomeSearchWidget(searchController: searchController),
          const SizedBox(
            height: 10,
          ),
          const productList(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
