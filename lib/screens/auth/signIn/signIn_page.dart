import 'package:fit_fit_meal/screens/auth/signIn/signIn_context.dart';
import 'package:fit_fit_meal/widgets/boxDecoration/home_gradnient_bacground.dart';
import 'package:fit_fit_meal/widgets/buttons/pop_back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: homeGradientBacground(),
          child: Stack(
            alignment: Alignment.center,
            children: const [
              SignInContext(),
              Positioned(
                top: 5,
                left: 5,
                child: PopBackArrow(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
