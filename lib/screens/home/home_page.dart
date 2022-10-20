import 'package:fit_fit_meal/screens/home/home_sign_up_button.dart';
import 'package:fit_fit_meal/screens/home/home_sign_in_button.dart';
import 'package:fit_fit_meal/screens/home/home_title.dart';
import 'package:fit_fit_meal/widgets/boxDecoration/home_gradnient_bacground.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.red,
          body: Center(
            child: Container(
              width: double.infinity,
              decoration: homeGradientBacground(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  HomeTitle(),
                  SizedBox(height: 150),
                  HomeSignUpButton(),
                  HomeSignInButton(),
                ],
              ),
            ),
          )),
    );
  }
}
