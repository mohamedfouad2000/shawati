import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/profile%20cubit/profile_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/profile%20cubit/profile_state.dart';
import 'package:shawati/Feature/home/presentation/views/screens/booking_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/mainhome_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/menu_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/search_screen.dart';
import 'package:shawati/generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView(
      {super.key,
      required this.currentidex,
      this.text,
      this.categoryId,
      this.minPrice,
      this.maxPrice,
      this.bed,
      this.floor,
      this.bath,
      this.priceDuration,
      this.minarea,
      this.maxarea});
  final int currentidex;

  final String? text;
  final int? categoryId;
  final double? minPrice;
  final double? maxPrice;
  final int? bed;
  final int? floor;
  final int? bath;
  final int? priceDuration;
  final String? minarea;
  final String? maxarea;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentind = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      currentind = widget.currentidex;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const MainHomeScreen(),
      const SearchScreen(),
      const BookingScreen(),
      const MenuScreen()
    ];

    return BlocProvider(
      create: (context) => ProfileCubit(HomeRepoImpl())..getProfileData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(child: screens[currentind]),
            bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                  (Set<MaterialState> states) =>
                      states.contains(MaterialState.selected)
                          ? TextStyle(color: ConstColor.kMainColor)
                          : const TextStyle(color: Colors.black),
                ),
              ),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 1),
                        blurRadius: 2,
                        spreadRadius: 1,
                        color: Theme.of(context).primaryColor.withOpacity(.125))
                  ],
                ),
                child: NavigationBar(
                  animationDuration: const Duration(seconds: 1),
                  indicatorColor: Colors.transparent,
                  onDestinationSelected: (value) {
                    print(value);
                    setState(() {
                      if (value == 0) {
                        BlocProvider.of<ProfileCubit>(context).getProfileData();
                      }
                      if (value == 1) {
                        SearchCubit.get(context).setallempty();
                      }
                      currentind = value;
                    });
                  },
                  backgroundColor: Colors.white,
                  destinations: [
                    NavigationDestination(
                        icon: ImageIcon(
                          const AssetImage(AssetsData.homeicon),
                          size: 27,
                          color: currentind == 0
                              ? ConstColor.kMainColor
                              : const Color(0xFF6E7177),
                        ),
                        label: S.of(context).Home),
                    NavigationDestination(
                        icon: ImageIcon(
                          const AssetImage(AssetsData.searchicon),
                          size: 27,
                          color: currentind == 1
                              ? ConstColor.kMainColor
                              : const Color(0xFF6E7177),
                        ),
                        label: S.of(context).Search),
                    NavigationDestination(
                        icon: ImageIcon(
                          const AssetImage(AssetsData.bookingicon),
                          size: 27,
                          color: currentind == 2
                              ? ConstColor.kMainColor
                              : const Color(0xFF6E7177),
                        ),
                        label: S.of(context).Booking),
                    NavigationDestination(
                        icon: ImageIcon(
                          const AssetImage(AssetsData.menuicon),
                          size: 27,
                          color: currentind == 3
                              ? ConstColor.kMainColor
                              : const Color(0xFF6E7177),
                        ),
                        label: S.of(context).Menu),
                  ],
                  selectedIndex: currentind,
                  elevation: 0.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
