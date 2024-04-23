import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Feature/home/presentation/views/screens/booking_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/mainhome_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/menu_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/search_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.currentidex});
  final int currentidex;

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

  List<Widget> screens = [
    const MainHomeScreen(),
    const SearchScreen(),
    const BookingScreen(),
    const MenuScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentind],
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 1),
        indicatorColor: Colors.transparent,
        onDestinationSelected: (value) {
          print(value);
          setState(() {
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
              label: 'Home'),
          NavigationDestination(
              icon: ImageIcon(
                const AssetImage(AssetsData.searchicon),
                size: 27,
                color: currentind == 1
                    ? ConstColor.kMainColor
                    : const Color(0xFF6E7177),
              ),
              label: 'Search'),
          NavigationDestination(
              icon: ImageIcon(
                const AssetImage(AssetsData.bookingicon),
                size: 27,
                color: currentind == 2
                    ? ConstColor.kMainColor
                    : const Color(0xFF6E7177),
              ),
              label: 'Booking'),
          NavigationDestination(
              icon: ImageIcon(
                const AssetImage(AssetsData.menuicon),
                size: 27,
                color: currentind == 3
                    ? ConstColor.kMainColor
                    : const Color(0xFF6E7177),
              ),
              label: 'Menu'),
        ],
        selectedIndex: currentind,
        elevation: 0.0,
      ),
    );
  }
}
