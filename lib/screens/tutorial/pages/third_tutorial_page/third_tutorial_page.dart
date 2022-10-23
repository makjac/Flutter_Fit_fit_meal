import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../widgets/boxDecoration/home_gradnient_bacground.dart';

class ThirdTutorialPage extends StatelessWidget {
  const ThirdTutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: homeGradientBacground(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 40),
                  LottieBuilder.asset(
                    'assets/lottie/scan_barcode.json',
                    animate: true,
                    repeat: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
