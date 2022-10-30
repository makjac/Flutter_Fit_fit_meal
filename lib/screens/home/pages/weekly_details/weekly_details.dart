import 'package:auto_size_text/auto_size_text.dart';
import 'package:fit_fit_meal/utils/insets.dart';
import 'package:flutter/material.dart';

import '../main/widgets/bar_chart/bar_chart.dart';

List<double> data = [2230, 1968, 1000, 2777, 2000, 2150, 2333];
List<String> days = ["M", "T", "W", "T", "F", "S", "S"];

class WeeklyDetails extends StatelessWidget {
  const WeeklyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text("weekly details"),
              centerTitle: true,
              backgroundColor: Colors.orange,
              shadowColor: Colors.transparent,
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(Insets.s),
                child: orientation == Orientation.portrait
                    ? _portraitView()
                    : _landscapeView(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _portraitView() => Column(
        children: <Widget>[
          _chart(
            "Daily calories",
            "Your calories in a week",
            Colors.red,
            const Color.fromARGB(100, 244, 67, 54),
            const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(10),
            ),
          ),
          const SizedBox(height: Insets.s),
          _chart(
            "Daily sugar",
            "Your sugar in a week",
            Colors.pink,
            const Color.fromARGB(100, 233, 30, 98),
          ),
          const SizedBox(height: Insets.s),
          _chart(
            "Daily fats",
            "Your fats in a week",
            Colors.amber,
            const Color.fromARGB(100, 255, 193, 7),
          ),
          const SizedBox(height: Insets.s),
          _chart(
            "Daily protein",
            "Your protein in a week",
            Colors.green,
            const Color.fromARGB(100, 76, 175, 79),
          ),
          const SizedBox(height: Insets.s),
          _chart(
            "Daily salt",
            "Your salt in a week",
            Colors.blue,
            const Color.fromARGB(100, 33, 149, 243),
          ),
          const SizedBox(height: Insets.s),
          _chart(
            "Daily carbohydrates",
            "Your carbohydrates in a week",
            Colors.black,
            const Color.fromARGB(100, 0, 0, 0),
            const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ],
      );

  Widget _landscapeView() => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        mainAxisSpacing: Insets.s,
        crossAxisSpacing: Insets.s,
        childAspectRatio: 1.3,
        physics: const ScrollPhysics(),
        children: [
          _chart(
            "Daily calories",
            "Your calories in a week",
            Colors.red,
            const Color.fromARGB(100, 244, 67, 54),
            const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(10),
            ),
          ),
          _chart(
            "Daily sugar",
            "Your sugar in a week",
            Colors.pink,
            const Color.fromARGB(100, 233, 30, 98),
          ),
          _chart(
            "Daily fats",
            "Your fats in a week",
            Colors.amber,
            const Color.fromARGB(100, 255, 193, 7),
          ),
          _chart(
            "Daily protein",
            "Your protein in a week",
            Colors.green,
            const Color.fromARGB(100, 76, 175, 79),
          ),
          _chart(
            "Daily salt",
            "Your salt in a week",
            Colors.blue,
            const Color.fromARGB(100, 33, 149, 243),
          ),
          _chart(
            "Daily carbohydrates",
            "Your carbohydrates in a week",
            Colors.black,
            const Color.fromARGB(100, 0, 0, 0),
            const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ],
      );

  Widget _chart(
          String title, String subtitle, Color activeColor, Color inactiveColor,
          [BorderRadiusGeometry? borderRadius]) =>
      BarChart(
        data: data,
        labels: days,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        height: 340,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.xs),
          child: AutoSizeText(
            title,
            maxLines: 1,
            style: TextStyle(
              color: activeColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        subtitle: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Insets.xs, vertical: 1),
          child: AutoSizeText(
            subtitle,
            maxLines: 1,
            style: TextStyle(
              color: activeColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(50, 116, 0, 0),
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(3, 3)),
          ],
        ),
      );
}
