import 'package:fit_fit_meal/screens/main/main_page.dart';
import 'package:fit_fit_meal/screens/menu/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: const MenuPage(),
      mainScreen: const MainPage(),
      showShadow: true,
      angle: -3,
      borderRadius: 20,
      style: DrawerStyle.defaultStyle,
      slideWidth: MediaQuery.of(context).size.width * 0.7,
    );
  }
}
