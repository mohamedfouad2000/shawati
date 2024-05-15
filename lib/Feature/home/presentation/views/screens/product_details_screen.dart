import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Add%20Or%20Remove%20Fav/add_or_remove_fav_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_details_screen_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen(
      {super.key, required this.model, required this.owner});

  final Service model;
  final ContactDetails owner;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: customAppBar(
            context,
            widget: BlocProvider(
              create: (context) => AddOrRemoveFavCubit(HomeRepoImpl()),
              child: BlocConsumer<AddOrRemoveFavCubit, AddOrRemoveFavState>(
                listener: (context, state) {
                  if (state is AddOrRemoveFavSucc) {
                    if (state.msq == 'Added Successfully') {
                      showToast(msq: state.msq, color: Colors.green);
                    } else {
                      showToast(msq: state.msq, color: Colors.red);
                    }
                  } else if (state is AddOrRemoveFavError) {
                    showToast(msq: state.msg, color: Colors.red);
                  }
                },
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      if (SearchCubit.get(context)
                              .favoritesListSearch[model.id!]! ==
                          true) {
                        BlocProvider.of<AddOrRemoveFavCubit>(context)
                            .removeFav(id: model.id!, context: context);
                      } else {
                        BlocProvider.of<AddOrRemoveFavCubit>(context)
                            .addFav(id: model.id!, context: context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.withOpacity(.4), width: .7),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: ImageIcon(
                            const AssetImage(AssetsData.save),
                            color: SearchCubit.get(context)
                                    .favoritesListSearch[model.id!]!
                                ? ConstColor.kMainColor
                                : Colors.grey,
                            size: 8,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          body: ProductDetailsScreenBody(
            model: model,
            owner: owner,
          ),
        );
      },
    );
  }
}
