import 'package:fit_fit_meal/widgets/menu/menu_widget.dart';
import 'package:flutter/material.dart';

class ScanerPage extends StatelessWidget {
  const ScanerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text("Scaner"),
        centerTitle: true,
        leading: const MenuWidget(),
        backgroundColor: Colors.orange,
        shadowColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Scan product"),
        icon: const Icon(Icons.qr_code_scanner_outlined),
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
      ),
    );
  }
}
