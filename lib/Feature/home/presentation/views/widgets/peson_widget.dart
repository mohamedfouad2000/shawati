import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/profile%20cubit/profile_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/profile%20cubit/profile_state.dart';
import 'package:shawati/Feature/home/presentation/views/screens/profile_edit_screen.dart';
import 'package:shawati/generated/l10n.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProfileSucc) {
          return InkWell(
            onTap: () {
              NavegatorPush(context, const ProfileInfoScreen());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      // color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(1, 1),
                            blurRadius: 2,
                            spreadRadius: 1,
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(.125))
                      ],
                    ),
                    child: CachedImage('$xURLIMAGE${state.model.data?.image}'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.model.data?.name ?? "",
                          style: StylesData.font18,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          S.of(context).viewPofile,
                          style: StylesData.font12
                              .copyWith(color: ConstColor.kMainColor),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        NavegatorPush(context, const ProfileInfoScreen());
                      },
                      icon: Icon(
                        LocalizationCubit.get(context).isArabic()
                            ? Icons.keyboard_double_arrow_left
                            : Icons.keyboard_double_arrow_right,
                        size: 20,
                        color: ConstColor.kMainColor,
                      ))
                ],
              ),
            ),
          );
        } else if (state is ProfileError) {
          return Text(state.msg);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
