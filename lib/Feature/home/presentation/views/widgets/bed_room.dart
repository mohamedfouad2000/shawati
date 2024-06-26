import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawati/generated/l10n.dart';

class BedRoomFIltter extends StatefulWidget {
  const BedRoomFIltter({
    super.key,
  });

  @override
  State<BedRoomFIltter> createState() => _BedRoomFIltterState();
}

class _BedRoomFIltterState extends State<BedRoomFIltter> {
  // int currentIndex = 0;

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
              S.of(context).bedRooms,
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
                  return typeItem(index: index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: 18,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget typeItem({required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          print(index);

          SearchCubit.get(context).bed = index;
          print(SearchCubit.get(context).bed);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            color: SearchCubit.get(context).bed == index
                ? ConstColor.kMainColor
                : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.shade300)),
        child: Center(
          child: Text(
            '${index + 1}',
            style: StylesData.font17.copyWith(
                fontSize: 15,
                color: SearchCubit.get(context).bed == index
                    ? Colors.white
                    : Colors.black),
          ),
        ),
      ),
    );
  }
}
