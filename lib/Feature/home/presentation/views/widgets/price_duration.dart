import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';

List<String> titles = [
  'Daily',
  'weekly',
  'Monthly',
  'Yearly',
];

class PriceDuration extends StatefulWidget {
  const PriceDuration({
    super.key,
  });

  @override
  State<PriceDuration> createState() => _PriceDurationState();
}

class _PriceDurationState extends State<PriceDuration> {
  // int currentIndexduration = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price duration",
              style: StylesData.font16,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return typeItem(name: titles[index], index: index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: 4,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget typeItem({required String name, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          print(index);
          SearchCubit.get(context).priceDuration = index;

          print(SearchCubit.get(context).priceDuration);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            color: SearchCubit.get(context).priceDuration == index
                ? ConstColor.kMainColor
                : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.shade300)),
        child: Center(
          child: Text(
            name,
            style: StylesData.font17.copyWith(
                fontSize: 15,
                color: SearchCubit.get(context).priceDuration == index
                    ? Colors.white
                    : Colors.black),
          ),
        ),
      ),
    );
  }
}
