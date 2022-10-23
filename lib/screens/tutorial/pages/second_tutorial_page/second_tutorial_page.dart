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
  double? height;
  double? wheight;
  int? age;

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
        _genderPicker(width),
        _wheightPicker(),
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

  Widget _genderPicker(double width) => Row(
        children: [
          Expanded(
            child: _genderButton(
              true,
              "Male",
              const Icon(
                Icons.male,
                size: 40,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _genderButton(
              false,
              "Female",
              const Icon(
                Icons.female,
                size: 40,
              ),
            ),
          ),
        ],
      );

  Widget _genderButton(bool isMale, String label, Icon icon) => SizedBox(
        height: 70,
        child: ElevatedButton(
          onPressed: () => setState(() {
            gender = isMale;
          }),
          style: (gender == isMale) ? _pickedButton() : _unPickedButton(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(label),
            ],
          ),
        ),
      );

  ButtonStyle _pickedButton() => ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
      );

  ButtonStyle _unPickedButton() => ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      );

  Widget _wheightPicker() => SizedBox(
        height: 100,
        child: ListWheelScrollView(
          itemExtent: 34,
          diameterRatio: 20,
          children: List.generate(
            300,
            (index) => Column(
              children: <Widget>[
                Text("$index"),
                const Text("kg"),
              ],
            ),
          ),
        ),
      );
}
