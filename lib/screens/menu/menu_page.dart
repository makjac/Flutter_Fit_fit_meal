import 'package:fit_fit_meal/data/models/menu_item.dart';
import 'package:flutter/material.dart';

class Menuelements {
  static const main = MenuElement(label: "Home", icon: Icon(Icons.home));
  static const scanProduct =
      MenuElement(label: "Scan Product", icon: Icon(Icons.qr_code));
  static const profile =
      MenuElement(label: "Profile", icon: Icon(Icons.person));
  static const logout = MenuElement(label: "Log out", icon: Icon(Icons.logout));

  static const elements = [
    main,
    scanProduct,
    profile,
    logout,
  ];
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            ...Menuelements.elements
                .map((element) => _buildMenuItem(element))
                .toList(),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(MenuElement element) => ListTile(
        minLeadingWidth: 20,
        leading: element.icon,
        title: Text(element.label),
        onTap: () {},
      );
}
