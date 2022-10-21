import 'package:fit_fit_meal/widgets/menu/menu_widget.dart';
import 'package:flutter/material.dart';

class ScanerPage extends StatelessWidget {
  const ScanerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaner"),
        centerTitle: true,
        leading: const MenuWidget(),
      ),
    );
  }
}
