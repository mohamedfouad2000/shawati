import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Core/widgets/custom_loading_widget.dart';
import 'package:shawati/Core/widgets/loading/clock_in_out_loading.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Notification/notification_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/profile%20cubit/profile_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/profile%20cubit/profile_state.dart';
import 'package:shawati/Feature/home/presentation/views/screens/notification_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/profile_edit_screen.dart';
import 'package:shawati/Feature/location/presentation/views/enable_location_view.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProfileSucc) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  NavegatorPush(
                      context,
                      const EnableLocation(
                        fromLogin: false,
                      ));
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: .7),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(13),
                      )),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage(AssetsData.locationIcon),
                      height: 15,
                      width: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${state.model.data?.name}",
                      maxLines: 1,
                      style: StylesData.font24Google,
                    ),
                    Text(
                      LocalizationCubit.get(context).isArabic()
                          ? ProfileCubit.get(context).placeAr ?? ''
                          : ProfileCubit.get(context).place ?? '',
                      style: StylesData.font9,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              BlocProvider(
                create: (context) =>
                    NotificationCubit(HomeRepoImpl())..getNotificationsCount(),
                child: BlocBuilder<NotificationCubit, NotificationState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        NavegatorPush(context, const NotificationScreen());
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: .7),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(13),
                                )),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Image(
                                image: AssetImage(AssetsData.notification),
                                height: 15,
                                width: 15,
                              ),
                            ),
                          ),
                          if (state is GetNotificationCountSucc &&
                              state.count > 0)
                            const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.red,
                              ),
                            )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  NavegatorPush(context, const ProfileInfoScreen());
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage(AssetsData.testimage),
                      // ),
                      borderRadius: BorderRadius.all(
                    Radius.circular(13),
                  )),
                  child: CachedNetworkImage(
                    imageUrl: '$xURLIMAGE${state.model.data?.image}',
                    placeholder: (context, url) =>
                        LoadingAnimationWidget.newtonCradle(
                      size: 50,
                      color: Colors.grey,
                    ),
                    errorWidget: (context, url, er) => Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is ProfileError) {
          return Text(state.msg.toString());
        } else {
          return const CustomLoadingWidget(child: ClockInOutLoading());
        }
      },
    );
  }
}

//  ClipRRect(
//                     borderRadius: BorderRadius.circular(1000000),
//                     child: CachedNetworkImage(
//                       height: 46,
//                       width: 46,
//                       imageUrl: profImge != 'null'
//                           ? 'https://system.tqnia.me/$profImge'
//                           : 'https://system.tqnia.me/assets/images/avatar.jpg',
//                       placeholder: (context, url) =>
//                           LoadingAnimationWidget.newtonCradle(
//                         size: 50,
//                         color: Colors.grey,
//                       ),
//                       errorWidget: (context, url, er) => Container(
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
