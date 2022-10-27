import 'package:auto_size_text/auto_size_text.dart';
import 'package:fit_fit_meal/utils/insets.dart';
import 'package:fit_fit_meal/utils/scale.dart';
import 'package:fit_fit_meal/widgets/boxDecoration/home_gradnient_bacground.dart';
import 'package:fit_fit_meal/widgets/inputDecoration/border_cross.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FirstTutorialPage extends StatelessWidget {
  const FirstTutorialPage({super.key});

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
            padding: const EdgeInsets.all(Insets.s),
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
        Expanded(
          flex: 4,
          child: _welcomeLottie(),
        ),
        Expanded(
          child: _welcomeTiltle(width),
        ),
        const Spacer(),
        Expanded(
          flex: 2,
          child: _nameTextField(),
        ),
      ],
    );
  }

  Widget _landscapeView(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child: _welcomeLottie()),
        Expanded(
          child: Column(
            children: <Widget>[
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 5,
                child: _welcomeTiltle(width),
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: width / 3,
                  child: _nameTextField(),
                ),
              ),
              const Spacer(),
            ],
          ),
        )
      ],
    );
  }

  Widget _welcomeLottie() => LottieBuilder.asset(
        'assets/lottie/hello.json',
        animate: true,
        repeat: false,
        height: 270,
      );

  Widget _welcomeTiltle(double width) => Column(
        children: <Widget>[
          AutoSizeText(
            "Wellcome!",
            maxLines: 1,
            textScaleFactor: Scale.textScale(width, 1),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
          ),
          AutoSizeText(
            "Nice to meet you! What is your name?",
            maxLines: 2,
            textScaleFactor: Scale.textScale(width, 1),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      );

  Widget _nameTextField() => TextFormField(
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: borderCross(
          "Your name (optional)",
          const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      );
}
