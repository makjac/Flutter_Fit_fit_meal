import 'package:fit_fit_meal/screens/main/widgets/bar_chart.dart';
import 'package:fit_fit_meal/widgets/menu/menu_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/insets.dart';

List<double> data = [2230, 1968, 1000, 2777, 2000, 2150, 2333];
List<String> days = ["M", "T", "W", "T", "F", "S", "S"];

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
      body: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: BarChart(
          data: data,
          labels: days,
          // width: 200,
          height: 300,
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.xs),
            child: Text(
              "hello",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
