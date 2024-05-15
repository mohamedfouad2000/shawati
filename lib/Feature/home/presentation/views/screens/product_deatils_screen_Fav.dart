import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Add%20Or%20Remove%20Fav/add_or_remove_fav_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_details_screen_body.dart';

class ProductDetailsScreenFav extends StatelessWidget {
  const ProductDetailsScreenFav(
      {super.key, required this.model, required this.owner});

  final Service model;
  final ContactDetails owner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        widget: BlocConsumer<AddOrRemoveFavCubit, AddOrRemoveFavState>(
          listener: (context, state) {
            if (state is AddOrRemoveFavSucc) {
              showToast(msq: state.msq, color: Colors.red);
            } else if (state is AddOrRemoveFavError) {
              showToast(msq: state.msg, color: Colors.red);
            }
          },
          builder: (context, state) {
            return InkWell(
              onTap: () {
                if (AddOrRemoveFavCubit.get(context)
                        .favoritesListFav[model.id!]! ==
                    true) {
                  BlocProvider.of<AddOrRemoveFavCubit>(context)
                      .removeFavFavList(id: model.id!, context: context);
                } else {
                  BlocProvider.of<AddOrRemoveFavCubit>(context)
                      .addFavFavList(id: model.id!, context: context);
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
                      color: AddOrRemoveFavCubit.get(context)
                              .favoritesListFav[model.id!]!
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
      body: ProductDetailsScreenBody(
        model: model,
        owner: owner,
      ),
    );
  }
}
