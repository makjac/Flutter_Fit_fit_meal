import 'package:auto_size_text/auto_size_text.dart';
import 'package:fit_fit_meal/screens/main/widgets/bar_chart/bar_chart.dart';
import 'package:fit_fit_meal/screens/main/widgets/bmi_chart/bmi_chart.dart';
import 'package:fit_fit_meal/screens/main/widgets/labelled_data.dart';
import 'package:fit_fit_meal/utils/calorie_calculator.dart';
import 'package:fit_fit_meal/widgets/boxDecoration/shadow_radius_all.dart';
import 'package:fit_fit_meal/widgets/menu/menu_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/insets.dart';

List<double> data = [2230, 1968, 1000, 2777, 2000, 2150, 2333];
List<String> days = ["M", "T", "W", "T", "F", "S", "S"];

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final userPPM = CalorieCalculator.calculatePPM();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
        centerTitle: true,
        leading: const MenuWidget(),
        backgroundColor: Colors.orange,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.orange,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: Insets.s,
              right: Insets.s,
              bottom: Insets.s,
            ),
            child: orientation == Orientation.portrait
                ? _portraitView(userPPM)
                : _landscapeView(userPPM),
          ),
        ),
      ),
    );
  }

  Widget _landscapeView(double? userPPM) => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: _chart()),
              const SizedBox(width: Insets.s),
              Expanded(
                child: SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _ppm(userPPM, 140),
                      _cpm(userPPM, 140),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Insets.s),
          _bmi(),
        ],
      );

  Widget _portraitView(double? userPPM) => Column(
        children: <Widget>[
          _chart(),
          const SizedBox(height: Insets.s),
          _ppm(userPPM),
          const SizedBox(height: Insets.s),
          _cpm(userPPM),
          const SizedBox(height: Insets.s),
          _bmi(),
        ],
      );

  Widget _chart() => BarChart(
        data: data,
        labels: days,
        enableLabels: true,
        height: 300,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.xs),
          child: AutoSizeText(
            "Daily Calories",
            maxLines: 1,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        subtitle: const Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.xs, vertical: 1),
          child: AutoSizeText(
            "Your calories in a week",
            maxLines: 1,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(30),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(50, 116, 0, 0),
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(3, 3)),
          ],
        ),
      );

  Widget _ppm(double? userPPM, [double? height]) => SizedBox(
        width: double.infinity,
        child: LabelledData(
          label: "Basal metabolic rate",
          height: height,
          data: AutoSizeText(
            userPPM != null
                ? "${userPPM.ceil().toString()} kcal"
                : "uzupełnij dane",
            maxLines: 1,
            style: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.w500, fontSize: 22),
          ),
          decoration: shadowRadiusAll(10),
        ),
      );

  Widget _cpm(double? userPPM, [double? height]) {
    final userCPM = CalorieCalculator.calculateCPM(userPPM);
    return SizedBox(
      width: double.infinity,
      child: LabelledData(
        label: "Total Metabolic Rate",
        height: height,
        data: AutoSizeText(
          userCPM != null
              ? "${userCPM.ceil().toString()} kcal"
              : "uzupełnij dane",
          maxLines: 1,
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.w500, fontSize: 22),
        ),
        decoration: shadowRadiusAll(10),
      ),
    );
  }

  Widget _bmi() {
    final userBMI = CalorieCalculator.calculateBMI();
    return SizedBox(
      width: double.infinity,
      child: LabelledData(
        label: "Body mass index",
        data: userBMI != null
            ? Column(
                children: [
                  AutoSizeText(
                    "Your BMI: ${userBMI.toStringAsFixed(2)}",
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                  ),
                  const SizedBox(height: Insets.s),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Insets.xs),
                    child: BMIChart(
                      bmi: CalorieCalculator.calculateBMI(),
                      height: 50,
                    ),
                  ),
                ],
              )
            : const AutoSizeText(
                "uzupełnij dane",
                maxLines: 1,
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(50, 116, 0, 0),
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(3, 3)),
          ],
        ),
      ),
    );
  }
}
