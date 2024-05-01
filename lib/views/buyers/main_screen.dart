import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mutli_vendor_app/controllers/bottom_nav_controller.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider =
        Provider.of<BottomNavigationBarProvider>(context, listen: true);
    print('vuild bcall');
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomNavProvider.currentIndex,
            onTap: (value) {
              bottomNavProvider.currentIndex = value;
            },
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.yellow.shade900,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'HOME'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/explore.svg'),
                  label: 'CATEGORIES'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/shop.svg'),
                  label: 'STORE'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/cart.svg'),
                  label: 'CART'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/search.svg'),
                  label: 'SEARCH'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/account.svg'),
                  label: 'ACCOUNT')
            ]),
        body: Consumer<BottomNavigationBarProvider>(
          builder: (context, value, child) {
            return value.currentWidget;
          },
        ));
  }
}
