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
        _heightPicker(),
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
        height: 100,
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
        backgroundColor: const Color.fromARGB(150, 244, 67, 54),
        foregroundColor: const Color.fromARGB(100, 255, 255, 255),
      );

  Widget _heightPicker() => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            children: <Widget>[
              Text(
                "Height $height cm",
                style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(height: 8),
              Slider.adaptive(
                thumbColor: Colors.red,
                activeColor: Colors.red,
                inactiveColor: const Color.fromARGB(74, 244, 67, 54),
                label: "$height",
                value: height.toDouble(),
                onChanged: (value) => setState(() {
                  height = value.ceil();
                }),
                min: 0,
                max: 300,
              )
            ],
          ),
        ),
      );
}
