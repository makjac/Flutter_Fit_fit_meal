import 'package:fit_fit_meal/widgets/menu/menu_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        leading: const MenuWidget(),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.orange,
      ),
    );
  }
}
