import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_list.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/search_widget.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({super.key});

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  bool data = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16, top: 32, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeSearchWidget(
            searchController: searchController,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Recently search",
            style: StylesData.font16raleway,
          ),
          if (!data)
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (itemcontext, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              data = true;
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: ConstColor.kMainColor,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              const Expanded(child: Text("Houses")),
                              const ImageIcon(
                                AssetImage(
                                  AssetsData.arrow,
                                ),
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
          if (data) const productList(),
        ],
      ),
    );
  }
}
