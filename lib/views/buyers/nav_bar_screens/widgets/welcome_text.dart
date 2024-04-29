
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Hey Subru Myre,\n What are you looking for 👀',
          style: TextStyle(fontSize: 22),
        ),
        SvgPicture.asset('assets/icons/cart.svg')
      ],
    );
  }
}
