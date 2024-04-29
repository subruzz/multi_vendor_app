import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/account_screen.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/cart_screen.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/category_screen.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/home_screen.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/search_screen.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/store_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    CategoryScreen(),
    StoreScreen(),
    CartScreen(),
    SearchScreen(),
    AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.yellow.shade900,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'HOME'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/explore.svg'),
                label: 'CATEGORIES'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/shop.svg'),
                label: 'STORE'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/cart.svg'), label: 'CART'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/search.svg'),
                label: 'SEARCH'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/account.svg'),
                label: 'ACCOUNT')
          ]),
          body: _pages[_pageIndex],
    );
  }
}
