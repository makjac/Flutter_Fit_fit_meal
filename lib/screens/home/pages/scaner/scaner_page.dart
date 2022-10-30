import 'package:fit_fit_meal/widgets/menu/menu_widget.dart';
import 'package:flutter/material.dart';

class ScanerPage extends StatelessWidget {
  const ScanerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.orange,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Scaner"),
            centerTitle: true,
            leading: MenuWidget(),
            backgroundColor: Colors.orange,
            shadowColor: Colors.transparent,
          ),
          SliverToBoxAdapter(),
        ],
      ),
    );
  }
}
