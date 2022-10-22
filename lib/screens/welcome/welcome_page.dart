import 'package:fit_fit_meal/screens/welcome/welcome_sign_up_button.dart';
import 'package:fit_fit_meal/screens/welcome/welcome_sign_in_button.dart';
import 'package:fit_fit_meal/screens/welcome/welcome_title.dart';
import 'package:fit_fit_meal/widgets/boxDecoration/home_gradnient_bacground.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Container(
            width: double.infinity,
            decoration: homeGradientBacground(),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  WelcomeTitle(),
                  SizedBox(height: 150),
                  WelcomeSignUpButton(),
                  WelcomeSignInButton(),
                ],
              ),
            ),
          ),
        ));
  }
}
