import 'package:fit_fit_meal/screens/auth/forgot_password/forgot_context.dart';
import 'package:fit_fit_meal/widgets/boxDecoration/home_gradnient_bacground.dart';
import 'package:fit_fit_meal/widgets/buttons/pop_back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/auth/auth_bloc.dart';

class ForgotPasswdPage extends StatelessWidget {
  const ForgotPasswdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is RefreshEmailSend) {
              context.go("/");
            }
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: homeGradientBacground(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ForgotContext(),
                const Positioned(
                  top: 5,
                  left: 5,
                  child: PopBackArrow(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
