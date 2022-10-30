import 'package:fit_fit_meal/data/models/menu_item.dart';
import 'package:fit_fit_meal/screens/home/pages/main/main_page.dart';
import 'package:fit_fit_meal/screens/home/pages/profile/profile_page.dart';
import 'package:fit_fit_meal/screens/home/pages/scaner/scaner_page.dart';
import 'package:fit_fit_meal/screens/home/menu/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../widgets/snackBar/error_snack_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MenuElement currentElement = MenuElements.main;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignedOut) {
          context.go("/");
        }
        if (state is AuthError) {
          showErrorSnackBar(state.error, context);
        }
      },
      child: ZoomDrawer(
        menuScreen: Builder(
          builder: (context) => MenuPage(
            currentElement: currentElement,
            onSelectedElement: (element) {
              setState(() {
                currentElement = element;
                ZoomDrawer.of(context)?.close();
              });
            },
          ),
        ),
        mainScreen: _getScreen(),
        menuBackgroundColor: Colors.red,
        showShadow: true,
        angle: -5,
        mainScreenScale: 0,
        borderRadius: 20,
        style: DrawerStyle.style3,
        slideWidth: MediaQuery.of(context).size.width * 0.7,
        mainScreenTapClose: true,
        menuScreenWidth: MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 300),
      ),
    );
  }

  Widget _getScreen() {
    switch (currentElement) {
      case MenuElements.main:
        return const MainPage();
      case MenuElements.scanProduct:
        return const ScanerPage();
      case MenuElements.profile:
        return const ProfilePage();
    }
    return const MainPage();
  }
}
