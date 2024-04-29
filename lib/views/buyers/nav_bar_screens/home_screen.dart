import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/widgets/search_input.dart';
import 'package:mutli_vendor_app/views/buyers/nav_bar_screens/widgets/welcome_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 20, right: 20),
      child: const Column(
        children: [
          WelcomeText(),
          SizedBox(
            height: 13,
          ),
          SearchInputWidget()
        ],
      ),
    );
  }
}
