import 'package:flutter/material.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/account_screen.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/cart_screen.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/category_screen.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/home_screen.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/search_screen.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/store_screen.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    CategoryScreen(),
    StoreScreen(),
    CartScreen(),
    SearchScreen(),
    AccountScreen()
  ];
  int get currentIndex => _currentIndex;
  Widget get currentWidget => _pages[_currentIndex];
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
