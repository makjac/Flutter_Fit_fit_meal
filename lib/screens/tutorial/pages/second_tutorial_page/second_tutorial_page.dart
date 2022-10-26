import 'package:fit_fit_meal/screens/tutorial/pages/second_tutorial_page/widgets/gender_picker.dart';
import 'package:fit_fit_meal/screens/tutorial/pages/second_tutorial_page/widgets/height_picekr.dart';
import 'package:fit_fit_meal/screens/tutorial/pages/second_tutorial_page/widgets/int_picker.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/boxDecoration/home_gradnient_bacground.dart';

class SecondTuorialPage extends StatefulWidget {
  const SecondTuorialPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SecondTuorialPage> createState() => _SecondTuorialPageState();
}

class _SecondTuorialPageState extends State<SecondTuorialPage> {
  bool? gender;
  int height = 0;
  int wheight = 0;
  int age = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: homeGradientBacground(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: orientation == Orientation.portrait
                ? _portraitView(width)
                : _landscapeView(width),
          ),
        ),
      ),
    );
  }

  Widget _portraitView(double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _helpTitle(),
        GenderPicker(
          gender: gender,
          onChanged: (value) => setState(() {
            gender = value;
          }),
        ),
        const SizedBox(height: 8),
        HeightPicker(
          height: height,
          onChanged: (value) => setState(() {
            height = value.ceil();
          }),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: IntPicker(
                label: "Wheight",
                unit: "kg",
                isUnit: true,
                value: wheight,
                onChanged: (value) => setState(() {
                  wheight = value;
                }),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: IntPicker(
                label: "Age",
                value: age,
                onChanged: (value) => setState(() {
                  age = value;
                }),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _landscapeView(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[],
    );
  }

  Widget _helpTitle() => const Text(
        "Help us to calculate your daily caloric needs!",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      );
}
