import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/filter_screen_body.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key, required this.location});
  final LocationData location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWithCallender(context),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return FilterScreenBody(
            location: location,
          );
        },
      ),
    );
  }
}
