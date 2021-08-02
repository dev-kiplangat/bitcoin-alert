import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar alertInlineNav() {
  return AppBar(
    backgroundColor: Colors.white,
    toolbarHeight: 70,
    elevation: 0,
    leading: null,
    bottom: TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 3.0,
      labelPadding: EdgeInsets.only(bottom: 15),
      tabs: [
        SvgPicture.asset(
          'assets/icons/BTC.svg',
          height: 35,
        ),
        SvgPicture.asset(
          'assets/icons/ETH.svg',
          height: 35,
        ),
        SvgPicture.asset(
          'assets/icons/DOGE.svg',
          height: 35,
        ),
      ],
    ),
  );
}
