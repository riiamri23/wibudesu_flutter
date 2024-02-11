import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WDAppBarLayout extends StatelessWidget {
  const WDAppBarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/emoji-emoticon-happy.svg",
              width: 40,
              height: 40,
            ),
            onPressed: () {},
          ),
          const Text(
            'Wibudesu',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search-svgrepo-com.svg",
              width: 40,
              height: 40,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
