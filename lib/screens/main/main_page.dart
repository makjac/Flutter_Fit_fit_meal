import 'package:fit_fit_meal/widgets/boxDecoration/home_gradnient_bacground.dart';
import 'package:fit_fit_meal/widgets/menu/menu_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
        centerTitle: true,
        leading: const MenuWidget(),
        backgroundColor: Colors.orange,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.orange,
      // body: Container(
      //   decoration: homeGradientBacground(),
      // ),
    );
  }
}
